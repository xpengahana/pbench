USE iceberg.tpch_sf100_parquet_iceberg_zstd;
DROP table IF EXISTS lineitem;
DROP table IF EXISTS orders;
DROP table IF EXISTS customer;
DROP table IF EXISTS part;
DROP table IF EXISTS supplier;
DROP table IF EXISTS nation;
DROP table IF EXISTS region;
DROP table IF EXISTS partsupp;

DROP schema iceberg.tpch_sf100_parquet_iceberg_zstd;

show schemas from iceberg;