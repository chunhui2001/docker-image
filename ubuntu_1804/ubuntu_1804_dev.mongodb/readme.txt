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