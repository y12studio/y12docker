Fri Mar  6 12:37:44 CST 2015
```
$ docker build -f Dockerfile.bitcore-wallet -t y12docker/bitcore-wallet .
$ docker images | grep bitcore
y12docker/bitcore-wallet    latest              430353b95bf5        16 seconds ago      645.9 MB
$ CID=$(docker run -d y12docker/bitcore-wallet)
$ docker exec -t -i $CID bash -l

# wallet --version
0.0.1
# cd node_modules/bitcore-wallet-service/
# node app.js &
# cd /opt/bws
# wallet -f alice.dat create mySharedWallet 2-2 alice -t  

info Generating new keys
verb Wallet created 59fdd673-f7f6-470d-ad88-955f973405c6 testnet
POST /copay/api/v1/wallets/ 200 33.905 ms - 51
verb Notification NewCopayer { walletId: '59fdd673-f7f6-470d-ad88-955f973405c6',
verb Notification   copayerId: '46c677223cf664dd9ced261b27e0290b39f813477d43a5c2349f0f2970fe34ac',
verb Notification   copayerName: 'alice' }
 * Testnet Wallet Created.
 * Saving file alice.dat
POST /copay/api/v1/wallets/59fdd673-f7f6-470d-ad88-955f973405c6/copayers 200 138.715 ms - 1075
   - Secret to share:
        C7Xb3DzXb7bQ8mjSugACMTL1jPYSkGMXmynkyb4mCfBvcjzpRuxEyfekVWNtX2SsSNLcHdHnHDT


# wallet -f alice.dat status
    GET /copay/api/v1/wallets/ 200 32.459 ms - 1058
    GET /copay/api/v1/wallets/ 200 25.532 ms - 1058
    * Wallet mySharedWallet [testnet]: 2-of-2 pending
         Missing copayers: 1
          Wallet secret: C7Xb3DzXb7bQ8mjSugACMTL1jPYSkGMXmynkyb4mCfBvcjzpRuxEyfekVWNtX2SsSNLcHdHnHDT
    * Copayers: alice
    * Balance 0 bit (Locked: 0 bit)

# wallet -f bob.dat join C7Xb3DzXb7bQ8mjSugACMTL1jPYSkGMXmynkyb4mCfBvcjzpRuxEyfekVWNtX2SsSNLcHdHnHDT bob
verb Notification NewCopayer { walletId: '59fdd673-f7f6-470d-ad88-955f973405c6',
verb Notification   copayerId: '9800ebbfcafe17ac716a37727b8163be5e3e95a40c6720911313c85749a02411',
verb Notification   copayerName: 'bob' }
POST /copay/api/v1/wallets/59fdd673-f7f6-470d-ad88-955f973405c6/copayers 200 84.437 ms - 1905
 * Wallet Joined. mySharedWallet
 * Saving file bob.dat


# wallet -f alice.dat status
GET /copay/api/v1/wallets/ 200 31.088 ms - 1888
info Your wallet has just been completed. Please backup your wallet file or use the export command.
GET /copay/api/v1/wallets/ 200 30.067 ms - 1888
* Wallet mySharedWallet [testnet]: 2-of-2 complete
* Copayers: alice, bob
* Balance 0 bit (Locked: 0 bit)

# wallet -f alice.dat address
verb Notification NewAddress undefined
POST /copay/api/v1/addresses/ 200 182.984 ms - 286
* New Address 2N5AeHSnS1rUSXpY8Cmegmg77s34a5U4JVf

# wallet -f alice.dat address
verb Notification NewAddress undefined
POST /copay/api/v1/addresses/ 200 86.221 ms - 286
* New Address 2NEWzASfVeBxggFJsUz7CjWE31BgfraTDBi

```
