# install
https://tecadmin.net/install-mongodb-on-ubuntu/

# cli
$ mongo

# Setting up and connecting to a remote MongoDB database
$ mongo
> use admin;
> db.createUser({
      user: "admin",
      pwd: "myadminpassword",
      roles: [
                { role: "userAdminAnyDatabase", db: "admin" },
                { role: "readWriteAnyDatabase", db: "admin" },
                { role: "dbAdminAnyDatabase",   db: "admin" }
             ]
  });

> use admin;
> db.createUser({
      user: "admin",
      pwd: "myadminpassword",
      roles: [
                { role: "userAdminAnyDatabase", db: "admin" },
                { role: "readWriteAnyDatabase", db: "admin" },
                { role: "dbAdminAnyDatabase",   db: "admin" }
             ]
  });


$ sudo vim /etc/mongod.conf
security:
    authorization: 'enabled'


## By default mongodb is configured to allow connections only from localhost. 
## We need to allow remote connections. 
## In the same config file, go to the network interfaces section and change the bindIp from 127.0.0.1 to 0.0.0.0 which means allow connections from all ip addresses.
# network interfaces
net:
    port: 27017
    bindIp: 0.0.0.0   #default value is 127.0.0.1

### 导出导入
1. mongodump -d dbname -o dumpname -u username -p password
2. scp -r user@remote:~/location/of/dumpname ./
3. mongorestore -d dbname dumpname/dbname/ -u username -p password

#!/bin/bash

if [ ! $1 ]; then
        echo " Example of use: $0 database_name [dir_to_store]"
        exit 1
fi
db=$1
out_dir=$2
if [ ! $out_dir ]; then
        out_dir="./"
else
        mkdir -p $out_dir
fi

tmp_file="fadlfhsdofheinwvw.js"
echo "print('_ ' + db.getCollectionNames())" > $tmp_file
cols=`mongo $db $tmp_file | grep '_' | awk '{print $2}' | tr ',' ' '`
for c in $cols
do
    mongoexport -d $db -c $c -o "$out_dir/exp_${db}_${c}.json"
done
rm $tmp_file