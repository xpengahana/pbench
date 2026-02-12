CREATE SCHEMA IF NOT EXISTS "hive"."tpch_sf1_parquet" WITH (location='s3a://presto-workload/tpch-sf1-parquet/');

USE hive.tpch_sf1_parquet;
SET SESSION hive.compression_codec='NONE';
create table IF NOT EXISTS lineitem with(format='PARQUET') as select * from tpch.sf1.lineitem;
create table IF NOT EXISTS orders with(format='PARQUET') as select * from tpch.sf1.orders;
create table IF NOT EXISTS customer with(format='PARQUET') as select * from tpch.sf1.customer;
create table IF NOT EXISTS part with(format='PARQUET') as select * from tpch.sf1.part;
create table IF NOT EXISTS supplier with(format='PARQUET') as select * from tpch.sf1.supplier;
create table IF NOT EXISTS nation with(format='PARQUET') as select * from tpch.sf1.nation;
create table IF NOT EXISTS region with(format='PARQUET') as select * from tpch.sf1.region;
create table IF NOT EXISTS partsupp with(format='PARQUET') as select * from tpch.sf1.partsupp;


analyze lineitem;
analyze orders;
analyze customer;
analyze part;
analyze supplier;
analyze nation;
analyze region;
analyze partsupp;

show stats for lineitem;
show stats for orders;
show stats for customer;
show stats for part;
show stats for supplier;
show stats for nation;
show stats for region;
show stats for partsupp;