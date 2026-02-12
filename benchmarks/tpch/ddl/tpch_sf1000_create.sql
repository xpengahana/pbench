CREATE SCHEMA IF NOT EXISTS "hive"."tpch_sf1000_parquet" WITH (location='s3a://presto-workload/tpch-sf1000-parquet/');

USE hive.tpch_sf1000_parquet;
SET SESSION hive.compression_codec='NONE';
create table IF NOT EXISTS lineitem with(format='PARQUET') as select * from tpch.sf1000.lineitem;
create table IF NOT EXISTS orders with(format='PARQUET') as select * from tpch.sf1000.orders;
create table IF NOT EXISTS customer with(format='PARQUET') as select * from tpch.sf1000.customer;
create table IF NOT EXISTS part with(format='PARQUET') as select * from tpch.sf1000.part;
create table IF NOT EXISTS supplier with(format='PARQUET') as select * from tpch.sf1000.supplier;
create table IF NOT EXISTS nation with(format='PARQUET') as select * from tpch.sf1000.nation;
create table IF NOT EXISTS region with(format='PARQUET') as select * from tpch.sf1000.region;
create table IF NOT EXISTS partsupp with(format='PARQUET') as select * from tpch.sf1000.partsupp;


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