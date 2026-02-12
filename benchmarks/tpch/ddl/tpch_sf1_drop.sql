USE hive.tpch_sf1_parquet;
DROP table IF EXISTS lineitem;
DROP table IF EXISTS orders;
DROP table IF EXISTS customer;
DROP table IF EXISTS part;
DROP table IF EXISTS supplier;
DROP table IF EXISTS nation;
DROP table IF EXISTS region;
DROP table IF EXISTS partsupp;

DROP schema hive.tpch_sf1_parquet;

show schemas from hive;