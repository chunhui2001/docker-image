
# 客户端
$ clickhouse-client --host 127.0.0.1 --port 9000 --user default

# 创建数据库
> CREATE DATABASE testdb;

# 查看数据库：
> SHOW DATABASES;

# 创建表（建表）
CREATE TABLE users
(
    id UInt64,
    name String,
    age UInt8,
    created_at DateTime
)
ENGINE = MergeTree()
ORDER BY id;

# 插入数据
INSERT INTO users VALUES
(1,'Alice',25,now()),
(2,'Bob',30,now());

# 查询数据
> SELECT * FROM users;

# 查看表结构
> DESCRIBE TABLE users;
> SHOW CREATE TABLE users;

# 删除表
> DROP TABLE users;

# 实际生产建表示例（日志统计）
CREATE TABLE access_log
(
    ts DateTime,
    user_id String,
    path String,
    status UInt16,
    bytes UInt64,
    latency_ms UInt32
)
ENGINE = MergeTree()
PARTITION BY toDate(ts) 		-- 按天分区
ORDER BY (ts, user_id); 		-- 查询速度更快

CREATE TABLE IF NOT EXISTS access_log_daily
(
    day Date,
    user_token String,
    remote_ip String,
    bytes_received UInt64,
    bytes_sent UInt64,
    request_count UInt64
)
ENGINE = SummingMergeTree 		-- SummingMergeTree 在 后台 merge 时自动累加数值字段：
PARTITION BY toYYYYMM(day) 		-- 按月分区
ORDER BY (user_token, remote_ip, day);

-- SummingMergeTree 在 后台 merge 时自动累加数值字段, 例如你插入：
2026-03-07 token1 1.1.1.1 bytes=100 req=1
2026-03-07 token1 1.1.1.1 bytes=200 req=1

-- merge 后会变成：
2026-03-07 token1 1.1.1.1 bytes=300 req=2

-- 非常适合：
流量统计
请求统计
metrics 聚合

-- PARTITION BY
 > PARTITION BY day

-- 按天分区：
2026-03-07
2026-03-08
2026-03-09

-- 优点：
> 查询某天非常快
> 删除历史数据简单

-- 例如删除 30 天前：
ALTER TABLE access_log_daily
DROP PARTITION '2026-02-01';

-- ORDER BY
> ORDER BY (user_token, remote_ip, day)

-- 排序键用于：
> 索引
> 查询加速

-- 例如查询：
> 某用户某天流量
> 会非常快。

-- IP 用 IPv4 类型
CREATE TABLE access_log_daily
(
    day Date,
    user_token String,
    remote_ip IPv4,
    bytes_received UInt64,
    bytes_sent UInt64,
    request_count UInt64
)
ENGINE = SummingMergeTree
PARTITION BY toYYYYMM(day)
ORDER BY (user_token, remote_ip, day);

> 比 String：
> 占用空间小
> 查询更快

-- 月分区
PARTITION BY toYYYYMM(day)
> ClickHouse 官方建议：不要按天分区，否则 partition 数量太多。


-- IP 用 IPv6 类型
CREATE TABLE access_log_daily
(
    day Date,
    user_token String,
    remote_ip IPv6,
    bytes_received UInt64,
    bytes_sent UInt64,
    request_count UInt64
)
ENGINE = SummingMergeTree
PARTITION BY toYYYYMM(day)
ORDER BY (user_token, remote_ip, day);

> ClickHouse 的 IPv6 类型 可以同时存 IPv4 和 IPv6。
> INSERT INTO access_log_daily VALUES
  ('2026-03-07','token1','1.2.3.4',1000,2000,1);
> ClickHouse 会自动存成：::ffff:1.2.3.4

-- 插入 IPv6
INSERT INTO access_log_daily VALUES
('2026-03-07','token1','2001:db8::1',1000,2000,1);

-- 查询时转换成人类可读
> SELECT IPv6NumToString(remote_ip)
  FROM access_log_daily;


| 类型    | IPv4 | IPv6 | 存储  | 推荐 |
| ------ | ---- | ---- | --- | -- |
| IPv4   | ✔    | ✖    | 最小  | ❌  |
| IPv6   | ✔    | ✔    | 16B | ✅  |
| String | ✔    | ✔    | 大   | ❌  |





