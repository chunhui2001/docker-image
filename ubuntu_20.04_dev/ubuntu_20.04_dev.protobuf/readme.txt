### 使用 ProtoBuf
#### 创建 .proto 文件，定义数据结构, 示例1: for c++
>>>> message Example1 {
>>>>     optional string stringVal 					= 1;
>>>>     optional bytes bytesVal 					= 2;
>>>>     repeated int32 repeatedInt32Val 			= 4;
>>>>     repeated string repeatedStringVal 			= 5;
>>>> }

#### 说明
#### required 字段只能也必须出现 1 次
#### optional 字段可出现 0 次或1次
#### repeated 字段可出现任意多次（包括 0）
#### 类型：int32、int64、sint32、sint64、string、32-bit ....
#### 字段编号：0 ~ 536870911（除去 19000 到 19999 之间的数字）

### 编译: protoc 编译 .proto 文件生成读写接口
#### 可通过如下命令生成相应的接口代码：
#### $SRC_DIR: .proto 所在的源目录
#### --cpp_out: 生成 c++ 代码
#### --java_out: 生成 java 代码
#### --c_out: 生成 C 代码
#### $DST_DIR: 生成代码的目标目录
#### xxx.proto: 要针对哪个 proto 文件生成接口代码
$ protoc -I=$SRC_DIR --cpp_out=$DST_DIR $SRC_DIR/xxx.proto


### 创建 .proto 文件，定义数据结构, 示例2: for java
#### 编译后可以找到的一个生成的 FirstProtobuf.java 文件
>>>> syntax = "proto2";
>>>> package protobuf;
>>>> option java_package = "com.sq.protobuf";
>>>> option java_outer_classname = "FirstProtobuf";
>>>> message testBuf {
>>>>     required int32 ID           = 1;
>>>>     required string Url         = 2;
>>>> }
$ protoc --java_out=./ first-protobuf.proto

### 序列化 For Java:
FirstProtobuf.testBuf.Builder builder=FirstProtobuf.testBuf.newBuilder();
>>>> builder.setID(777);
>>>> builder.setUrl("shiqi");
>>>> FirstProtobuf.testBuf info=builder.build();
>>>> byte[] result = info.toByteArray(); // 得到字节(不需要一个个查字节了)

### 反序列化 For Java:
>>> FirstProtobuf.testBuf testBuf = FirstProtobuf.testBuf.parseFrom(result);
>>> System.out.println(testBuf.getUrl());

### 
>>>> syntax = "proto2";
>>>> package protobuf;
>>>> option java_package = "com.sq.protobuf";
>>>> option java_outer_classname = "PersonEntity";//生成的数据访问类的类名  
>>>> message Person {  
>>>>   required int32 id = 1;//同上  
>>>>   required string name = 2;//必须字段，在后面的使用中必须为该段设置值  
>>>>   optional string email = 3;//可选字段，在后面的使用中可以自由决定是否为该字段设置值
>>>> }


### 创建 .proto 文件，定义数据结构, 示例3: for C
#### 包含协议号（默认0x010000）、魔数（默认0xfb709394）、用户名、电话、状态、邮箱（可选）信息；
syntax = "proto2";
option optimize_for = SPEED;
message User {
    required uint32 version = 1 [ default = 0x010000 ];
    required uint32 magic   = 2 [ default = 0xfb709394 ];
    required string name    = 3;
    required string phone   = 4;
    enum Status {
            IDLE = 1;
            BUSY = 2;
    };
    required Status stat    = 5 [ default = IDLE ]; 
    optional string email   = 6;
}
$ protoc -c --c_out=. user.proto
#### 将生成 user.pb-c.c、user.pb-c.h 两个文件，编译的时候需要加上 -lprotobuf-c 选项。

#### 序列化 For C:
>>>> static size_t __do_pack(u8 *buffer) {
>>>> 	User user;
>>>> 	user__init(&user);
>>>> 	user.name   = "zhangsan";
>>>> 	user.phone  = "010-1234-5678";
>>>> 	user.email  = "zhangsan@123.com";
>>>> 	user.stat   = USER__STATUS__IDLE;
>>>> 	return user__pack(&user, buffer);
>>>> }

#### 反序列化 For C:
>>>> static int __do_unpack(const u8 *buffer, size_t len) {
>>>> 	User *pusr = user__unpack(NULL, len, buffer);
>>>> 	if (!pusr) {
>>>> 	    printf("user__unpack failed\n");
>>>> 	    return FAILURE;
>>>> 	}
>>>> 	assert(pusr->magic == MAGIC);
>>>> 	assert(pusr->version == VERSION);
>>>> 	printf("Unpack: %s %s %s\n", pusr->name, pusr->phone, pusr->email);
>>>> 	user__free_unpacked(pusr, NULL);
>>>> 	return SUCCESS;
>>>> }
>>>> int main(int argc, char *argv[]) {
>>>> 	u8 buffer[1024] = {0}; 
>>>> 	size_t size = __do_pack(buffer);
>>>> 	printf("Packet size: %zd\n", size);
>>>> 	__do_unpack(buffer, size);
>>>> 	exit(EXIT_SUCCESS);
>>>> }

#### 执行结果:
>>>> Packet size: 55
>>>> Unpack: zhangsan 010-1234-5678 zhangsan@123.com

```
protobuf 的哲学在于定义结构标准，使用工具生成代码接口，达到跨语言的目的；
协议内容那块，对于数字组合能有效进行压缩，但字符串方面不处理，可以考虑结合libz进行压缩处理；
```



