
### Installation Guide
https://secure.phabricator.com/book/phabricator/article/installation_guide/

### Installing Phabricator on Ubuntu 20.04
https://manoramahp.medium.com/installing-phabricator-on-ubuntu-20-04-4a3e0f90acf8

### https://manoramahp.medium.com/installing-phabricator-on-ubuntu-20-04-4a3e0f90acf8
git clone https://github.com/phacility/libphutil.git
git clone https://github.com/phacility/arcanist.git
git clone https://github.com/phacility/phabricator.git

cd phabricator
./bin/config set mysql.host localhost
./bin/config set mysql.user root
./bin/config set mysql.pass <password>
./bin/storage upgrade --user root--password <password>
