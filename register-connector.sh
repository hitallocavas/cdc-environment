#!/bin/bash

curl -X POST http://localhost:8083/connectors \
  -H "Content-Type: application/json" \
  -d '{
    "name": "transactions-db-connector",
    "config": {
      "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
      "database.hostname": "postgres",
      "database.port": "5432",
      "database.user": "transactions-db-user",
      "database.password": "transactions-db-password",
      "database.dbname": "transactions-db",
      "database.server.name": "transactions-cdc",
      "plugin.name": "pgoutput",
      "table.include.list": "public.transactions",
      "slot.name": "debezium_slot",
      "publication.name": "debezium_publication",
      "tombstones.on.delete": "false",
      "key.converter": "org.apache.kafka.connect.json.JsonConverter",
      "key.converter.schemas.enable": "false",
      "value.converter": "org.apache.kafka.connect.json.JsonConverter",
      "value.converter.schemas.enable": "false"
    }
  }'
