import json
import time
import unittest
import requests.exceptions
from requests import put, get

#from requests.exceptions import ConnectionError

class TestHttp(unittest.TestCase):

    def setUp(self):
        pass

    def test_kibana_http_conn(self):
        r = get('http://localhost:8080/')
        self.assertEquals(200, r.status_code)

    def test_elasticsearch_http_conn(self):
        r = get('http://localhost:9200/')
        self.assertEquals(200, r.status_code)
        
if __name__ == "__main__":
    unittest.main()
