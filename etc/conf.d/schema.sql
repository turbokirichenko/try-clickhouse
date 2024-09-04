CREATE TABLE IF NOT EXISTS kafka_queue
(
    name String,
    surname String
) Engine = Kafka
SETTINGS
kafka_broker_list='kafka:19092',
kafka_topic_list='topic1',
kafka_group_name='clickhouse_consumer1',
kafka_format='JSONEachRow';

CREATE TABLE IF NOT EXISTS kafka_storage
(
    name String,
    surname String
) Engine = MergeTree;

CREATE MATERIALIZED VIEW kafka_view TO kafka_storage AS SELECT name, surname FROM kafka_queue;