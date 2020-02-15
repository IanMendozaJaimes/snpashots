#!/bin/bash
curl --request POST --url http://127.0.0.1:8888/v1/producer/create_snapshot --header 'content-type: application/json; harset=UTF-8' > snapshot.json
NAME=$(cat snapshot.json | jq -r '.snapshot_name')

pkill ^nodeos$

echo $NAME

rm -rf ~/.local/share/eosio/nodeos/data/state* ~/.local/share/eosio/nodeos/data/blocks


gnome-terminal -- /home/ianonsio/eosio/2.0/bin/nodeos --snapshot $NAME --plugin eosio::state_history_plugin --trace-history --chain-state-history --trace-history-debug-mode --disable-replay-opts

