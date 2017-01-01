## REF

https://github.com/yeasy/docker-compose-files/tree/master/hyperledger

chaincode example
https://github.com/hyperledger/fabric/blob/master/examples/chaincode/go/chaincode_example02/chaincode_example02.go

## LOG

```
$ docker-compose -v
docker-compose version 1.9.0, build 2585387
$ docker pull hyperledger/fabric-peer:x86_64-0.6.1-preview \
  && docker pull hyperledger/fabric-membersrvc:x86_64-0.6.1-preview \
  && docker pull yeasy/blockchain-explorer:latest \
  && docker tag hyperledger/fabric-peer:x86_64-0.6.1-preview hyperledger/fabric-peer \
  && docker tag hyperledger/fabric-peer:x86_64-0.6.1-preview hyperledger/fabric-baseimage \
  && docker tag hyperledger/fabric-membersrvc:x86_64-0.6.1-preview hyperledger/fabric-membersrvc
$ curl -O https://raw.githubusercontent.com/yeasy/docker-compose-files/master/hyperledger/0.6/noops/peer.yml
$ curl -O https://raw.githubusercontent.com/yeasy/docker-compose-files/master/hyperledger/0.6/noops/4-peers.yml
$ docker-compose -f 4-peers.yml up -d
Starting v2_vp0_1
Starting v2_vp2_1
Starting v2_vp3_1
Starting v2_vp1_1
$ alias vp1sh='docker exec -it v2_vp1_1'
$ vp1sh peer network list
{"Peers":[{"ID":{"name":"vp0"},"address":"172.18.0.2:7051","type":1},{"ID":{"name":"vp2"},"address":"172.18.0.3:7051","type":1},{"ID":{"name":"vp3"},"address":"172.18.0.4:7051","type":1}]}
```

vp1 instance.

```
$ vp1sh bash
root@vp1:/opt/gopath/src/github.com/hyperledger/fabric#
# peer chaincode deploy -p github.com/hyperledger/fabric/examples/chaincode/go/chaincode_example02 -c '{"Function":"init", "Args": ["a","6100", "b", "6200"]}'

08:18:13.142 [chaincodeCmd] chaincodeDeploy -> INFO 001 Deploy result: type:GOLANG chaincodeID:<path:"github.com/hyperledger/fabric/examples/chaincode/go/chaincode_example02" name:"4b95edf2798e76dc410adb4d88eae20c4cb5b7d6315bcf2e404630e586e600482244490795b2018068d0662502d39ce2b026518a839de0f9b61d65077838d7d6" > ctorMsg:<args:"init" args:"a" args:"6100" args:"b" args:"6200" >
Deploy chaincode: 4b95edf2798e76dc410adb4d88eae20c4cb5b7d6315bcf2e404630e586e600482244490795b2018068d0662502d39ce2b026518a839de0f9b61d65077838d7d6
# alias pcq='peer chaincode query -n 4b95edf2798e76dc410adb4d88eae20c4cb5b7d6315bcf2e404630e586e600482244490795b2018068d0662502d39ce2b026518a839de0f9b61d65077838d7d6'

# pcq -c '{"Function": "query", "Args": ["a"]}'
08:19:37.166 [chaincodeCmd] chaincodeInvokeOrQuery -> INFO 001 Successfully queried transaction: chaincodeSpec:<type:GOLANG chaincodeID:<name:"4b95edf2798e76dc410adb4d88eae20c4cb5b7d6315bcf2e404630e586e600482244490795b2018068d0662502d39ce2b026518a839de0f9b61d65077838d7d6" > ctorMsg:<args:"query" args:"a" > >
Query Result: 6100
# pcq -c '{"Function": "query", "Args": ["b"]}'
08:21:26.067 [chaincodeCmd] chaincodeInvokeOrQuery -> INFO 001 Successfully queried transaction: chaincodeSpec:<type:GOLANG chaincodeID:<name:"4b95edf2798e76dc410adb4d88eae20c4cb5b7d6315bcf2e404630e586e600482244490795b2018068d0662502d39ce2b026518a839de0f9b61d65077838d7d6" > ctorMsg:<args:"query" args:"b" > >
Query Result: 6200

// Transaction makes payment of X units from A to B
# alias pci='peer chaincode invoke -l golang -n 4b95edf2798e76dc410adb4d88eae20c4cb5b7d6315bcf2e404630e586e600482244490795b2018068d0662502d39ce2b026518a839de0f9b61d65077838d7d6'
# pci -c '{"Args": ["invoke", "a", "b", "10"]}'
08:33:39.029 [chaincodeCmd] chaincodeInvokeOrQuery -> INFO 001 Successfully invoked transaction: chaincodeSpec:<type:GOLANG chaincodeID:<name:"4b95edf2798e76dc410adb4d88eae20c4cb5b7d6315bcf2e404630e586e600482244490795b2018068d0662502d39ce2b026518a839de0f9b61d65077838d7d6" > ctorMsg:<args:"invoke" args:"a" args:"b" args:"10" > > (70eef7cb-01de-4b30-ade2-d7f38bf3a946)

# pcq -c '{"Function": "query", "Args": ["a"]}'
Query Result: 6090
# pcq -c '{"Function": "query", "Args": ["b"]}'
Query Result: 6210

```

vp0 instance.

```
$ alias vp0sh='docker exec -it v2_vp0_1'
$ vp0sh peer network list
{"Peers":[{"ID":{"name":"vp1"},"address":"172.18.0.5:7051","type":1},{"ID":{"name":"vp2"},"address":"172.18.0.3:7051","type":1},{"ID":{"name":"vp3"},"address":"172.18.0.4:7051","type":1}]}
$ vp0sh bash

# alias pcq='peer chaincode query -n 4b95edf2798e76dc410adb4d88eae20c4cb5b7d6315bcf2e404630e586e600482244490795b2018068d0662502d39ce2b026518a839de0f9b61d65077838d7d6'
# pcq -c '{"Function": "query", "Args": ["a"]}'
Query Result: 6090
# pcq -c '{"Function": "query", "Args": ["b"]}'
Query Result: 6210
```

cp -R chaincode_example02 foo

```
$ vp0sh
root@vp0:/opt/gopath/src/github.com/hyperledger/fabric
# cd examples/chaincode/go
# pwd
/opt/gopath/src/github.com/hyperledger/fabric/examples/chaincode/go
# cp -R chaincode_example02 foo
# cd foo
# mv chaincode_example02.go foo.go
# sed -i 's|Aval = Aval - X|Aval = Aval - X + 10|g' foo.go
# sed -i 's|Bval = Bval + X|Bval = Bval + X - 10|g' foo.go
# peer chaincode deploy -p github.com/hyperledger/fabric/examples/chaincode/go/foo -c '{"Function":"init", "Args": ["a","1000", "b", "2000"]}'
Deploy chaincode: 569a44e3a2c135a6932c8b74b416078e99a48bfae625528a41b9233472094643559c654d1a740a667166d418f28ff0ddea754f5f1a9c98c5f17db514aa848005
# alias pcq='peer chaincode query -n 569a44e3a2c135a6932c8b74b416078e99a48bfae625528a41b9233472094643559c654d1a740a667166d418f28ff0ddea754f5f1a9c98c5f17db514aa848005'
# alias pci='peer chaincode invoke -l golang -n 569a44e3a2c135a6932c8b74b416078e99a48bfae625528a41b9233472094643559c654d1a740a667166d418f28ff0ddea754f5f1a9c98c5f17db514aa848005'
# pcq -c '{"Function": "query", "Args": ["a"]}'
Query Result: 1000
# pcq -c '{"Function": "query", "Args": ["b"]}'
Query Result: 2000
# pci -c '{"Args": ["invoke", "a", "b", "50"]}'

# pcq -c '{"Function": "query", "Args": ["a"]}'
Query Result: 960
# pcq -c '{"Function": "query", "Args": ["b"]}'
Query Result: 2040
```
