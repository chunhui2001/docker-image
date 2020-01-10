
# 如果输入 thrift -version，提示说 thrift-compiler 没有安装, 则:
# $ apt-get install thrift-compiler

### 数据类型
A、Base Type :基本类型
（1）bool：布尔类型（true或false）
（2）byte：8位有符号整数
（3）i16：16位有符号整数
（4）i32：32位有符号整数
（5）i64：64位有符号整数
（6）double：64位浮点数
（7）string：文本字符串，使用UTF-8编码
B、Container：容器：如list、set、map
C、Struct：结构体类型, struct 和 C 里面的结构体很类似。
	struct People {
		1:string name;
		2:string sex;
	}
D、Exception:异常类型
E、Service：定义对象的接口和一系列方法
	service  DemoService {
		string getUserName(1:i32 id);
		i32 add(1:i32 num1, 2:i32 num2);
	}
	一个 service 对应一个类，里面是一些方法。
	如 getUserName 方法就是根据一个id返回一个字符串，add 方法是对 num1 和 num2 进行求和。



### 示例， 结构体类型 struct ，可以理解成 Java 中的 bean,看下面的一个 struct 示例
struct   User{
	1:i64 id;
	2:string  name;
	3:list<string> emails;
}

枚举类型 enum ,和Java中的 enum 类似
enum sex{
	1,  //1表示男  2表示女
	2
}

异常 exception ，thrift支持自定义异常
exception myException{
	1:i64 code;
	2:string  message;
}

服务 service  对应Java中的interface，使用thrift 生产Java 文件是 class 文件，class中有个内部接口   ，实现这个服务时候需要实现这个class中的 iface接口
service   IUserDao{
	i:32 addUserBean(1:UserBean user);
	i:32 delUserBean(1:i64 userID);
	UserBean findUserBean(1:i64 userID);
	list<UserBean> findUserBean(1:string name,2:i64 userID);
	UserBean alterUserBean(1:UserBean user);
}

自定义类型  typedef
typedef i32  int
typedef i64  long


常量  const
const  i64 ENTER =100；
const  string    dns=“www.vrv.com”；

包 package  也叫 namespace
namespace java com.vrv.ent
namespace java  com.jerfan.bz

引入  include  类似Java 中的 import 和c 中的include
include “com.vrv.ent“


注释  shell 风格  
单行  # 或者//
块    /**/


修饰符  required  表示必须的  optional  表示可选的
struct UserBean {
	1: required string name;
	2: optional i32 age;
} 




### thrift 简单例子: service
$ vim demo.thrift
namespace java com.demo
 
service DemoService{
	//根据id获取用户名
	string getNameById(1:i32 id)
}

### 编译创建代码
$ thrift  -r   --gen  java  demo.thrift


### thrift 生产 Java 代码 
新建一个后缀为thrift的文件 dao.thrif,起内容是 
namespace cpp com.vrv.im.dao 
namespace java com.vrv.im.dao

struct EntUserBean {
	1:i64 EntUserID;    
	2:string login; 
	3:string loginType;
	4:string extend;
	5:string userid;
}

struct UserBean {
	1:i64 id;   
	2:string name;  
	3:string nickName;
	4:string extend;
}

service IUserDao{
	list<UserBean> queryAllEntUser();
	i32 addUserBean(1:UserBean user);
	UserBean updateUserBean(1:UserBean user);
	UserBean queryUserBean(1:i64 userID);
	UserBean deleteUserBean(1:i64 userID);
}

service IEntUserDao{
	list<EntUserBean> queryAllEntUser();
	i32 addEntUser(1:EntUserBean user);
	EntUserBean updateEntUserBean(1:EntUserBean user);
	EntUserBean queryEntUserBean(1:i64 userID);
	EntUserBean deleteEntUserBean(1:i64 userID);
}



### 编译 thrift 0.12.0 时支持的语言依赖操作系统安装的语言

Building C (GLib) Library .... : yes
Building C# (Mono) Library ... : no
Building C++ Library ......... : yes
Building Common Lisp Library.. : no
Building D Library ........... : no
Building Dart Library ........ : no
Building dotnetcore Library .. : no
Building Erlang Library ...... : no
Building Go Library .......... : no
Building Haskell Library ..... : no
Building Haxe Library ........ : no
Building Java Library ........ : yes
Building Lua Library ......... : no
Building NodeJS Library ...... : no
Building Perl Library ........ : no
Building PHP Library ......... : no
Building Plugin Support ...... : no
Building Python Library ...... : yes
Building Py3 Library ......... : yes
Building Ruby Library ........ : no
Building Rust Library ........ : no

C++ Library:
   C++ compiler .............. : g++ -std=c++11
   Build TZlibTransport ...... : yes
   Build TNonblockingServer .. : yes
   Build TQTcpServer (Qt4) ... : no
   Build TQTcpServer (Qt5) ... : no
   C++ compiler version ...... : g++ (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0

Java Library:
   Using gradlew ............. : lib/java/gradlew
   Using java ................ : java
   Using javac ............... : javac
   Using Gradle version ...... : Gradle 4.4.1
   Using java version ........ : java version "1.8.0_211"

Python Library:
   Using Python .............. : /usr/bin/python
   Using Python version ...... : Python 2.7.15+
   Using Python3 ............. : /usr/bin/python3
   Using Python3 version ..... : Python 3.6.8

