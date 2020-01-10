

#### Docker PPTP VPN
$ docker pull mobtitude/vpn-pptp
$ sudo touch chap-secrets
$ sudo vi chap-secrets
# Secrets for authentication using CHAP
# client        server  secret                  IP addresses
username_here   *       password_here           *

$ docker run -d --privileged --name pptp --net=host -v $(pwd)/conf/chap-secrets:/etc/ppp/chap-secrets mobtitude/vpn-pptp

---------------------------------------------------
# Set up a VPN Server (PPTP) on AWS
---------------------------------------------------
1. Create a EC2 instance using `Ubuntu 14.04`.
2. In `Secure Group Inbound Rules`, add a `SSH Rule(TCP, Port 22, 0.0.0.0/0)` and a `Custom TCP Rule(TCP, Port 1723, 0.0.0.0/0)`.
3. Optional: Associate a Elastic IP with the instance.
4. SSH into the instance.
5. `sudo apt-get install pptpd`.
6. `sudo vim /etc/pptpd.conf`. Uncomment `localip 192.168.0.1` and `remoteip 192.168.0.234-238,192.168.0.245`.
7. `sudo vim /etc/ppp/pptpd-options`. Uncomment `ms-dns` and `ms-wins`. Change the IP to Google's DNS like this:
```
ms-dns 8.8.8.8
ms-dns 8.8.4.4

#...

ms-wins 8.8.8.8
ms-wins 8.8.4.4
```
8. `sudo vim /etc/ppp/chap-secrets`. Add VPN users in this format `<username> pptpd <passwd> *`.
9. `sudo vim /etc/sysctl.conf`. Uncomment `net.ipv4.ip_forward=1`.
10. `sudo /sbin/sysctl -p`.
11. `sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE`.
12. `sudo vim /etc/rc.local`. Add `iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE` before `exit 0`.
13. `sudo /etc/init.d/pptpd restart`.

---------------------------------------------------
# OSX Usage
---------------------------------------------------
1. Go to `System Preferences > Network`.
2. Click the `+` button. Choose `VPN` as interface. `PPTP` as VPN Type. And enter a name you can understand. Click `Create`.
3. Enter your instance's Public IP in `Server Address`.
4. Enter your `<username>` in `Account Name`.
5. Click `Authentication Settings`. Choose `Password` and enter your `<password>`.
6. Click `Advanced`. Check `Send all traffic over VPN connection`. Click `OK`.
7. Click `Apply`.
8. Click `Connect`.
9. You are good to go.

