# yum -y update
# yum -y groupinstall "Development Tools"
# yum -y install zlib-devel
# yum -y install xz-devel
# yum -y install cmake
# yum -y install openssl-devel
# yum install kernel-devel
# yum install vi
# yum install git
# yum install lynx

# wget http://pkgs.repoforge.org/hexedit/hexedit-1.2.10-1.el6.rf.x86_64.rpm
# rpm -Uvh hexedit-1.2.10-1.el6.rf.x86_64.rpm

# jdk-7u71-linux-x64.tar.gz
# wget http://www.us.apache.org/dist/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.tar.gz
# tar -xvf apache-maven-3.0.5-bin.tar.gz
# ln -s apache-maven-3.0.5 maven

# wget http://archive.apache.org/dist/ant/binaries/apache-ant-1.9.4-bin.tar.gz
# tar -xvf apache-ant-1.9.4-bin.tar.gz
# ln -s /usr/local/apache-ant-1.9.4 ant


# wget https://github.com/google/protobuf/releases/download/v2.5.0/protobuf-2.5.0.tar.gz
# tar -xvf protobuf-2.5.0.tar.gz
# cd protobuf-2.5.0
# ./configure
# make install


# wget --no-check-certificate https://archive.apache.org/dist/hadoop/core/hadoop-2.4.0/hadoop-2.4.0-src.tar.gz
# tar -xvf hadoop-2.4.0-src.tar.gz


# mvn package -Pdist,native -DskipTests -Dtar


# cd /usr/local/hadoop_src/hadoop-2.4.0-src/hadoop-dist/target/hadoop-2.4.0/lib/
# tar -cvf native_NEW.tar.gz native
# cp native_NEW.tar.gz /usr/lib/hadoop/lib/
# cd /usr/lib/hadoop/lib/
# tar -cvf native_ORIGINAL.tar.gz native
# rm -rf native
# tar -xvf native_NEW.tar.gz

### 确认生效
>>>>>>> $ ./hadoop checknative -a
>>>>>>> 19/08/30 11:42:00 INFO bzip2.Bzip2Factory: Successfully loaded & initialized native-bzip2 library system-native
>>>>>>> 19/08/30 11:42:00 INFO zlib.ZlibFactory: Successfully loaded & initialized native-zlib library
>>>>>>> Native library checking:
>>>>>>> hadoop: true /data/soft/hadoop-2.4.0/lib/native/libhadoop.so.1.0.0
>>>>>>> zlib:   true /lib64/libz.so.1
>>>>>>> snappy: true /lib64/libsnappy.so.1
>>>>>>> lz4:    true revision:99
>>>>>>> bzip2:  true /lib64/libbz2.so.1

That's it!





