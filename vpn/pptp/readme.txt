

#### Docker PPTP VPN
$ docker pull mobtitude/vpn-pptp
$ sudo touch chap-secrets
$ sudo vi chap-secrets
# Secrets for authentication using CHAP
# client        server  secret                  IP addresses
username        *       password                *

$ sudo docker run -d --privileged --net=host -p 1723:1723 -v ./conf/chap-secrets:/etc/ppp/chap-secrets mobtitude/vpn-pptp
