-- DDL to create TPC-H data schema: with primary key
CREATE TABLE customer (
  c_custkey BIGINT NOT NULL PRIMARY KEY,
  c_name VARCHAR(25),
  c_address VARCHAR(40),
  c_nationkey BIGINT,
  c_phone VARCHAR(15),
  c_acctbal DOUBLE,
  c_mktsegment VARCHAR(10),
  c_comment VARCHAR(117)
);
CREATE TABLE lineitem (
  l_orderkey BIGINT NOT NULL,
  l_partkey BIGINT,
  l_suppkey BIGINT,
  l_linenumber INTEGER NOT NULL,
  l_quantity DOUBLE,
  l_extendedprice DOUBLE,
  l_discount DOUBLE,
  l_tax DOUBLE,
  l_returnflag CHAR(1),
  l_linestatus CHAR(1),
  l_shipdate DATE,
  l_commitdate DATE,
  l_receiptdate DATE,
  l_shipinstruct VARCHAR(25),
  l_shipmode VARCHAR(10),
  l_comment VARCHAR(44),
  PRIMARY KEY (l_orderkey, l_linenumber)
);
CREATE TABLE nation (
  n_nationkey BIGINT NOT NULL PRIMARY KEY,
  n_name VARCHAR(25),
  n_regionkey BIGINT,
  n_comment VARCHAR(152)
);
CREATE TABLE orders (
  o_orderkey BIGINT NOT NULL PRIMARY KEY,
  o_custkey BIGINT,
  o_orderstatus CHAR(1),
  o_totalprice DOUBLE,
  o_orderdate DATE,
  o_orderpriority VARCHAR(15),
  o_clerk VARCHAR(15),
  o_shippriority INTEGER,
  o_comment VARCHAR(79)
);
CREATE TABLE part (
  p_partkey BIGINT NOT NULL PRIMARY KEY,
  p_name VARCHAR(55),
  p_mfgr VARCHAR(25),
  p_brand VARCHAR(10),
  p_type VARCHAR(25),
  p_size INTEGER,
  p_container VARCHAR(10),
  p_retailprice DOUBLE,
  p_comment VARCHAR(23)
);
CREATE TABLE partsupp (
  ps_partkey BIGINT NOT NULL,
  ps_suppkey BIGINT NOT NULL,
  ps_availqty INTEGER,
  ps_supplycost DOUBLE,
  ps_comment VARCHAR(199),
  PRIMARY KEY (ps_partkey, ps_suppkey)
);
CREATE TABLE region (
  r_regionkey BIGINT NOT NULL PRIMARY KEY,
  r_name VARCHAR(25),
  r_comment VARCHAR(152)
);
CREATE TABLE supplier (
  s_suppkey BIGINT NOT NULL PRIMARY KEY,
  s_name VARCHAR(25),
  s_address VARCHAR(40),
  s_nationkey BIGINT,
  s_phone VARCHAR(15),
  s_acctbal DOUBLE,
  s_comment VARCHAR(101)
);
