#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

ITEM_NAME=card
ITEM_COUNT=10
APP_HOSTNAME=localhost

ITEM_NAME_PLURAL=${ITEM_NAME}s
APP_URL=http://$APP_HOSTNAME:3000

PRIORITIES[0]="high"
PRIORITIES[1]="mid"
PRIORITIES[2]="low"

JQ_FORMAT='"  --> \(._id)\t\(.title)\t\(.priority)"'

BATCH_RUN_NAME=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 5)

####################

echo
echo "Batch run: $BATCH_RUN_NAME"
echo
echo "Creating $ITEM_COUNT $ITEM_NAME_PLURAL"

for CURRENT_ITEM_NUMBER in $(seq $ITEM_COUNT); do
    PRIORITY=$(echo ${PRIORITIES[ $[ $RANDOM % ${#PRIORITIES[@]} ] ]})
    curl -s $APP_URL/api/$ITEM_NAME_PLURAL -X POST -H "Content-Type: application/json" \
        -d '{"title":"Task '$BATCH_RUN_NAME' '$CURRENT_ITEM_NUMBER'", "priority":"'$PRIORITY'"}' \
        | jq -r "$JQ_FORMAT"
done

####################

echo
echo "All $ITEM_NAME_PLURAL"

curl -s $APP_URL/api/$ITEM_NAME_PLURAL \
    | jq -r ".[] | $JQ_FORMAT"

####################

echo
echo "One random $ITEM_NAME"

IDS=(
    $(curl -s $APP_URL/api/$ITEM_NAME_PLURAL \
        | jq -r ".[] | ._id")
)

RANDOM_ID=$(echo ${IDS[ $[ $RANDOM % ${#IDS[@]} ] ]})

curl -s $APP_URL/api/$ITEM_NAME_PLURAL/$RANDOM_ID \
    | jq -r "$JQ_FORMAT"

echo
