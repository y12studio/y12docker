var request = require('request');
request({
    uri: 'http://localhost:8086/write?db=db1',
    method: 'POST',
    body: 'cpu_load_short,host=server01,region=us-west value=0.69'
}, function(err, res, body) {
    if (err) console.log(err)
    console.log(body)
})
