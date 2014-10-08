#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
import json
import time
import unittest
import requests.exceptions
from requests import put, get, post
from requests.exceptions import ConnectionError
from jsonpath_rw import jsonpath, parse
import sys, os
from elasticsearch import Elasticsearch

ESBASE = 'http://localhost:9200'
jp_expr_token = parse('tokens[*].token')

class FooIndex():
    
    def __init__(self):
        self.esindex = 'fooindex'
        self.estype = 'fulltext'
        self.script_dir = os.path.dirname(__file__)
        self.file_mapping = os.path.join(self.script_dir, 'mapping_fooindex.json')
        self.file_content = os.path.join(self.script_dir, 'content_fooindex.json')
    
    def esimport(self):
        es = Elasticsearch([{'host': "localhost", 'port': 9200}])
        es.indices.create(index=self.esindex, ignore=400)
        
        mapping = json.load(open(self.file_mapping ,'r'),encoding="utf-8")
        jarr = json.load(open(self.file_content ,'r'),encoding="utf-8")
        
        es.indices.put_mapping(index=self.esindex,doc_type=self.estype, body=mapping)
        for x in jarr:
            try:
                res = es.index(index=self.esindex, doc_type=self.estype, body=x)
            except ValueError:
                print("Oops! ValueError:")
                print(json.dumps(x, indent=4,ensure_ascii=False,encoding='utf8'))

class TestElasticSearch(unittest.TestCase):
    
    es = None
    
    @classmethod
    def setUpClass(cls):
        for i in range(10):
            try:
                r = get(ESBASE)
                if r.status_code == 200 :
                    FooIndex().esimport()
                    time.sleep(2)
                    break;
            except ConnectionError:
                time.sleep(2)

    def setUp(self):
        if self.es is None :
            self.es = Elasticsearch([{'host': 'localhost', 'port': 9200}])

    def test_kibana_http_conn(self):
        r = get('http://localhost:8080/')
        self.assertEquals(200, r.status_code)

    def test_es_http_conn(self):
        r = get(ESBASE)
        self.assertEquals(200, r.status_code)
        jr = r.json()
        self.assertEquals('You Know, for Search',jr['tagline'])
        self.assertTrue('version' in jr)
        
    def test_search_fooindex(self):
        res = self.es.search(index="fooindex", doc_type='fulltext', q="content:bitcoin")
        self.assertEquals(3, res['hits']['total'])
    
    def _jp(self,r):
        print(json.dumps(r, indent=4,ensure_ascii=False,encoding='utf8').encode('utf-8'))
        
if __name__ == "__main__":
    unittest.main()
