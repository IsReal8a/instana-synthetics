#!/bin/bash
sudo apt update
sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubectl
sudo apt install docker.io -y
sudo curl -sLS https://get.k3sup.dev | sh
k3sup install \
  --local \
  --no-extras \
  --context syntheticpop
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
sudo helm install --kubeconfig /etc/rancher/k3s/k3s.yaml synthetic-pop \
    --repo "https://agents.instana.io/helm" \
    --namespace syn \
    --create-namespace \
    --set downloadKey="YOUR_KEY" \
    --set controller.location="AWS_USEAST_IsraPOP;AWS_US_POP;N_Virginia;USA;38.8676006;-77.6456584;This is a Synthetic Point of Presence in US EAST for TVA testing" \
    --set controller.clusterName="syntheticpop" \
    --set controller.instanaKey="YOUR_KEY" \
    --set controller.instanaSyntheticEndpoint="https://YOUR_INSTANA_INSTANCE" \
    --set redis.tls.enabled=false \
    --set redis.password="1234567890" \
    --set controller.capabilities="syntheticType=HTTPAction\,HTTPScript\,BrowserScript\,WebpageScript;browserType=firefox\,chrome" \
    --set browserscript.enabled=true \
    synthetic-pop
sudo kubectl --kubeconfig /etc/rancher/k3s/k3s.yaml apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.11.0/cert-manager.yaml
sudo kubectl --kubeconfig /etc/rancher/k3s/k3s.yaml apply -f https://github.com/instana/instana-agent-operator/releases/latest/download/instana-agent-operator.yaml
cat > /tmp/instana-agent.yaml << 'EOL'
apiVersion: instana.io/v1
kind: InstanaAgent
metadata:
  name: instana-agent
  namespace: instana-agent
spec:
  zone:
    name: swe-dark-zone
  cluster:
      name: isra-pop
  agent:
    mode: INFRASTRUCTURE
    key: YOUR_INSTANA_KEY
    endpointHost: YOUR_INSTANA_ENDPOINT
    endpointPort: "443"
    env: {}
    configuration_yaml: |
      # Synthetic PoP
      com.instana.plugin.syntheticpop:
        enabled: true 
        poll_rate: 60 # seconds, minimum 60 seconds by default
  agent.cpuLimit: "1.0"
  agent.cpuReq: "0.5"
  agent.memLimit: "512Mi"
  agent.memReq: "256Mi"
EOL
sudo kubectl --kubeconfig /etc/rancher/k3s/k3s.yaml apply -f /tmp/instana-agent.yaml