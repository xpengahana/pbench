CREATE SCHEMA IF NOT EXISTS "iceberg"."tpch_sf100_parquet_iceberg" WITH (location='s3a://presto-workload-v2/tpch-sf100-parquet-iceberg/');

USE iceberg.tpch_sf100_parquet_iceberg;
SET SESSION iceberg.compression_codec='NONE';
create table IF NOT EXISTS nation with(format='PARQUET') as select * from tpch.sf100.nation;
create table IF NOT EXISTS lineitem with(format='PARQUET') as select * from tpch.sf100.lineitem;
create table IF NOT EXISTS orders with(format='PARQUET') as select * from tpch.sf100.orders;
create table IF NOT EXISTS customer with(format='PARQUET') as select * from tpch.sf100.customer;
create table IF NOT EXISTS part with(format='PARQUET') as select * from tpch.sf100.part;
create table IF NOT EXISTS supplier with(format='PARQUET') as select * from tpch.sf100.supplier;
create table IF NOT EXISTS region with(format='PARQUET') as select * from tpch.sf100.region;
create table IF NOT EXISTS partsupp with(format='PARQUET') as select * from tpch.sf100.partsupp;

-- create table IF NOT EXISTS nation with(format='PARQUET') as select * from hive.tpch_sf100_parquet.nation;
-- create table IF NOT EXISTS lineitem with(format='PARQUET') as select * from hive.tpch_sf100_parquet.lineitem;
-- create table IF NOT EXISTS orders with(format='PARQUET') as select * from hive.tpch_sf100_parquet.orders;
-- create table IF NOT EXISTS customer with(format='PARQUET') as select * from hive.tpch_sf100_parquet.customer;
-- create table IF NOT EXISTS part with(format='PARQUET') as select * from hive.tpch_sf100_parquet.part;
-- create table IF NOT EXISTS supplier with(format='PARQUET') as select * from hive.tpch_sf100_parquet.supplier;
-- create table IF NOT EXISTS region with(format='PARQUET') as select * from hive.tpch_sf100_parquet.region;
-- create table IF NOT EXISTS partsupp with(format='PARQUET') as select * from hive.tpch_sf100_parquet.partsupp;

analyze nation;
analyze lineitem;
analyze orders;
analyze customer;
analyze part;
analyze supplier;
analyze region;
analyze partsupp;

show stats for nation;
show stats for lineitem;
show stats for orders;
show stats for customer;
show stats for part;
show stats for supplier;
show stats for region;
show stats for partsupp;