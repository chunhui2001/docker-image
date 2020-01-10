package main

import (
    "fmt"
    "io/ioutil"
    "github.com/ethereum/go-ethereum/accounts/keystore"
    "github.com/ethereum/go-ethereum/crypto"
)

func main() {
    inPath:="/root/blkchain1/keystore/UTC--2022-04-25T03-06-21.293988193Z--7c3fe04890eb98e1267ca3e76f7c802e9de8cfc1"
    outPath:="key.hex"
    password:="zch1234560SA"
    keyjson,e:=ioutil.ReadFile(inPath); if e != nil { panic(e) }
    key,e:=keystore.DecryptKey(keyjson,password); if e != nil { panic(e) }
    e=crypto.SaveECDSA(outPath,key.PrivateKey); if e!=nil { panic(e) }
    fmt.Println("Key saved to:",outPath)
}
