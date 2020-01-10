If you have the public address of the account and the password used to lock the account, you should be able to extract the private key. I used web3 python package to extract the private key. Install this using pip.

pip install web3
Execute the following code

>>> from web3.auto import w3
>>> with open("~/.ethereum/rinkeby/keystore/UTC--2018-06-
    10T05-43-22.134895238Z--9e63c0d223d9232a4f3076947ad7cff353cc1a28") 
     as keyfile:
...     encrypted_key = keyfile.read()
...     private_key = w3.eth.account.decrypt(encrypted_key, 'password')

UTC--2018-06-10T05-43-22.134895238Z--9e63c0d223d9232a4f3076947ad7cff353cc1a28 is the file containing stored key. This will return a private key in byte format.

You can get the private key in hex format as follows.

import binascii
binascii.b2a_hex(private_key)