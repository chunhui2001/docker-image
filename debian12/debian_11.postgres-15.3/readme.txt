# 进入 postgres cli
$ /usr/bin/psql -U keesh newsletter 
# 退出
> kong-# \q
# List of databases
> kong-# \l
# List of schemas
> kong-# \dn+
# connect to new database
> kong=# \c postgres
# 新建 schema
> kong=# create schema test_schema;
# 建表
> kong=# create table test_schema.test_table (id int);
# 列出schema下的所有表
> kong=# \dt test_schema.
# 显示表结构
> kong=# \d test_schema.