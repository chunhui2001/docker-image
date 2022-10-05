readme:
===============
https://github.com/hwdsl2/docker-ipsec-vpn-server#configure-and-use-ikev2-vpn

$ docker run \
    --name ipsec-vpn-server \
    --env-file ./vpn.env \
    --restart=always \
    -v $(pwd)/ikev2-vpn-data:/etc/ipsec.d \
    -p 500:500/udp \
    -p 4500:4500/udp \
    -p 1701:1701/udp \
    -d --privileged \
    hwdsl2/ipsec-vpn-server

#### 
===============
>>>> IKEv2 setup successful. Details for IKEv2 mode:
>>>> 
>>>> VPN server address: 18.183.23.44
>>>> VPN client name: vpnclient
>>>> 
>>>> Client configuration is available inside the
>>>> Docker container at:
>>>> /etc/ipsec.d/vpnclient.p12 (for Windows & Linux)
>>>> /etc/ipsec.d/vpnclient.sswan (for Android)
>>>> /etc/ipsec.d/vpnclient.mobileconfig (for iOS & macOS)
>>>> 
>>>> Next steps: Configure IKEv2 clients. See:
>>>>   https://git.io/ikev2docker
>>>> Feedback: https://bit.ly/vpn-feedback

#####
===============
Learn how to manage IKEv2 clients.
You can manage IKEv2 clients using the helper script. See examples below. To customize client options, run the script without arguments.
# Add a new client (using default options)
docker exec -it ipsec-vpn-server ikev2.sh --addclient [client name]
# Export configuration for an existing client
docker exec -it ipsec-vpn-server ikev2.sh --exportclient [client name]
# List existing clients
docker exec -it ipsec-vpn-server ikev2.sh --listclients
# Show usage
docker exec -it ipsec-vpn-server ikev2.sh -h


#####
===============
>>>> OS X (macOS)
>>>> First, securely transfer the generated .mobileconfig file to your Mac, then double-click and follow the prompts to import as a macOS profile. If your Mac runs macOS Big Sur or newer, open System Preferences and go to the Profiles section to finish importing. When finished, check to make sure "IKEv2 VPN" is listed under System Preferences -> Profiles.

#####
===============
>>>> To connect to the VPN:
>>>> Open System Preferences and go to the Network section.
>>>> Select the VPN connection with Your VPN Server IP (or DNS name).
>>>> Check the Show VPN status in menu bar checkbox.
>>>> Click Connect.

#####
===============
>>>> iOS
>>>> First, securely transfer the generated .mobileconfig file to your iOS device, then import it as an iOS profile. To transfer the file, you may use:

>>>> AirDrop, or
>>>> Upload to your device (any App folder) using File Sharing, then open the "Files" App on your iOS device, move the uploaded file to the "On My iPhone" folder. After that, tap the file and go to the "Settings" App to import, or
>>>> Host the file on a secure website of yours, then download and import it in Mobile Safari.
>>>> When finished, check to make sure "IKEv2 VPN" is listed under Settings -> General -> VPN & Device Management or Profile(s).

>>>> To connect to the VPN:
>>>> Go to Settings -> VPN. Select the VPN connection with Your VPN Server IP (or DNS name).
>>>> Slide the VPN switch ON.





