#!/bin/bash

# SYNTHETIC_TEST_ID="TEST_ID_RANDOM_THING"

# echo "Getting Metrics Catalog"\n
# curl --request GET \
#   --url https://INSTANA_INSTANCE/api/application-monitoring/catalog/metrics \
#   --header "authorization: apiToken ${INSTANA_API_TOKEN}"

# echo "Getting a single Synthetic test"\n
# curl --request GET \
#   --url https://INSTANA_INSTANCE/api/synthetics/settings/tests/$SYNTHETIC_TEST_ID\
#   --header "authorization: apiToken ${INSTANA_API_TOKEN}"

# GET ALL LOCATIONS
# curl --request GET \
#   --url https://INSTANA_INSTANCE/api/synthetics/settings/locations\
#   --header "authorization: apiToken ${INSTANA_API_TOKEN}"

# CREATE A SIMPLE EXAMPLE
# curl -k -v -X POST \
# https://INSTANA_INSTANCE/api/synthetics/settings/tests \
# -H "authorization: apiToken ${INSTANA_API_TOKEN}" \
# -H 'content-type: application/json' \
# -d '{
#     "label":"My simple test label",
#     "description":"This is to test a simple ping API",
#     "applicationId":"YOUR_APPLICATION_PERSPECTIVE_ID",
#     "active":true,
#     "testFrequency":5,
#     "playbackMode":"Simultaneous",
#     "locations":[
#         "YOUR_POP_LOCATION_1",
#         "YOUR_POP_LOCATION_2"
#     ],
#     "configuration":{
#         "syntheticType":"HTTPAction",
#         "url":"https://httpbin.org/post",
#         "operation":"POST",
#         "headers":{
#             "Content-Type":"text/plain"
#         },
#         "body":"Hello World!",
#         "validationString":"Hello World!"
#     },
#     "customProperties":{
#         "Team":"DevTeam",
#         "Purpose":"Demo"
#     }
#   }'

# UPDATE A SIMPLE EXAMPLE
# curl -k -v -X PUT \
# https://INSTANA_INSTANCE/api/synthetics/settings/tests \
# -H "authorization: apiToken ${INSTANA_API_TOKEN}" \
# -H 'content-type: application/json' \
# -d '{
#     "label":"My simple test changed the label",
#     "description":"This is to test a simple ping API",
#     "applicationId":"YOUR_APPLICATION_PERSPECTIVE_ID",
#     "active":true,
#     "testFrequency":5,
#     "playbackMode":"Simultaneous",
#     "locations":[
#         "YOUR_POP_LOCATION_1"
#     ],
#     "configuration":{
#         "syntheticType":"HTTPAction",
#         "url":"https://httpbin.org/post",
#         "operation":"POST",
#         "headers":{
#             "Content-Type":"text/plain"
#         },
#         "body":"Hello World!",
#         "validationString":"Hello World!"
#     },
#     "customProperties":{
#         "Team":"OtherTeam",
#         "Purpose":"PROD"
#     }
#   }'
