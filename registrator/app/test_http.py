import requests
import time
class TestWebRequest:

    @classmethod
    def setUpClass(cls):
        time.sleep(5)

    def test_web1(self):
        r = requests.get('http://web1.service.consul:8000/')
        assert 200 == r.status_code

    def test_web2(self):
        r = requests.get('http://web2.service.consul:8000/')
        assert 200 == r.status_code

    def test_consul_catalog(self):
        r = requests.get('http://consul.service.consul:8500/')
        assert 200 == r.status_code
        r = requests.get('http://consul.service.consul:8500/v1/catalog/nodes')
        assert 200 == r.status_code
        assert 'consul' == r.json()[0]['Node']
