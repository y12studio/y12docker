https://hyperledger-fabric.readthedocs.io/en/latest/Setup/Network-setup/

```
$ cat /etc/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=14.04
DISTRIB_CODENAME=trusty
DISTRIB_DESCRIPTION="Ubuntu 14.04.4 LTS"
$ docker -v && docker-compose -v
Docker version 1.12.3, build 6b644ec
docker-compose version: 1.5.1
$ docker pull hyperledger/fabric-peer:latest
$ docker pull hyperledger/fabric-membersrvc:latest
$ ip add
...
3: docker0: ...
    link/ether 02:42:ad:be:70:cb brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 scope global docker0
       valid_lft forever preferred_lft forever
    inet6 fe80::42:adff:febe:70cb/64 scope link
       valid_lft forever preferred_lft forever

$ nano docker-compose.yml
$ docker-compose up -d
Starting fabric06_vp0_1
Starting fabric06_vp1_1
Starting fabric06_vp2_1
$ docker ps
CONTAINER ID        IMAGE                     COMMAND             CREATED             STATUS              PORTS               NAMES
37da84f75f77        hyperledger/fabric-peer   "peer node start"   3 minutes ago       Up 3 minutes                            fabric06_vp2_1
692e0220f216        hyperledger/fabric-peer   "peer node start"   3 minutes ago       Up 3 minutes                            fabric06_vp1_1
7d9794b31e86        hyperledger/fabric-peer   "peer node start"   3 minutes ago       Up 3 minutes                            fabric06_vp0_1
$ alias vp0sh='docker exec -it fabric06_vp0_1'
$ alias vp1sh='docker exec -it fabric06_vp1_1'
$ vp0sh peer version
Fabric peer server version 0.6.1-preview
$ vp0sh peer network list
{"Peers":[{"ID":{"name":"vp1"},"address":"172.17.0.3:7051","type":1},{"ID":{"name":"vp2"},"address":"172.17.0.4:7051","type":1}]}
$ vp1sh peer network list
{"Peers":[{"ID":{"name":"vp2"},"address":"172.17.0.4:7051","type":1},{"ID":{"name":"vp0"},"address":"172.17.0.2:7051","type":1}]}
```
test chaincode
```
$ vp1sh bash
$ /opt/gopath/src/github.com/hyperledger/fabric
$ peer chaincode deploy -p github.com/hyperledger/fabric/examples/chaincode/go/chaincode_example02 -c '{"Args": ["init", "a","100", "b", "200"]}'
06:48:34.659 [chaincodeCmd] chaincodeDeploy -> INFO 001 Deploy result: type:GOLANG chaincodeID:<path:"github.com/hyperledger/fabric/examples/chaincode/go/chaincode_example02" name:"ee5b24a1f17c356dd5f6e37307922e39ddba12e5d2e203ed93401d7d05eb0dd194fb9070549c5dc31eb63f4e654dbd5a1d86cbb30c48e3ab1812590cd0f78539" > ctorMsg:<args:"init" args:"a" args:"100" args:"b" args:"200" >
Deploy chaincode: ee5b24a1f17c356dd5f6e37307922e39ddba12e5d2e203ed93401d7d05eb0dd194fb9070549c5dc31eb63f4e654dbd5a1d86cbb30c48e3ab1812590cd0f78539
$ peer chaincode query -n ee5b24a1f17c356dd5f6e37307922e39ddba12e5d2e203ed93401d7d05eb0dd194fb9070549c5dc31eb63f4e654dbd5a1d86cbb30c48e3ab1812590cd0f78539 -c '{"Function": "query", "Args": ["a"]}'
Error: Error querying chaincode: rpc error: code = 2 desc = Error:Failed to launch chaincode spec(Could not get deployment transaction for ee5b24a1f17c356dd5f6e37307922e39ddba12e5d2e203ed93401d7d05eb0dd194fb9070549c5dc31eb63f4e654dbd5a1d86cbb30c48e3ab1812590cd0f78539 - LedgerError - ResourceNotFound: ledger: resource not found)
```
