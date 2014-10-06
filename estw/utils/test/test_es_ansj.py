#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
import json
import time
import unittest
import requests.exceptions
from requests import put, get, post
from mapping_ansj import FooIndex
from requests.exceptions import ConnectionError
from jsonpath_rw import jsonpath, parse
import sys

ESBASE = 'http://localhost:9200'
jp_expr_token = parse('tokens[*].token')

class TestElasticSearch(unittest.TestCase):
    
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
        pass

    def test_kibana_http_conn(self):
        r = get('http://localhost:8080/')
        self.assertEquals(200, r.status_code)

    def test_es_http_conn(self):
        r = get(ESBASE)
        self.assertEquals(200, r.status_code)
        jr = r.json()
        self.assertEquals('You Know, for Search',jr['tagline'])
        self.assertTrue('version' in jr)

    def test_fooindex_import(self):
        r = get('%s/fooindex/fulltext/_count'%ESBASE)
        jr = r.json()
        self.assertEquals(200, r.status_code)
        self.assertEquals(3, jr['count'])
        # self.assertEquals('You Know, for Search',json.dumps(jr, ensure_ascii=False,encoding='utf8'))
        
    def _get_analyzer(self,payload):
        r = post("%s/fooindex/_analyze?analyzer=ansj_index"%ESBASE, payload)
        return r.json()

    def test_sc(self):
        # curl -XGET 'http://localhost:9200/fooindex/_analyze?pretty=true&analyzer=ansj_index' -d '三峡河龙埔里河堤外工程施工导致河流改道，造成对岸(介寿里)土地流失'
        payload_sc = '三峡河龙埔里河堤外工程施工导致河流改道，造成对岸(介寿里)土地流失'
        
        jr_sc = self._get_analyzer(payload_sc)
        mlist_sc = [match.value for match in jp_expr_token.find(jr_sc)]
        str = ','.join(mlist_sc)
        print('\nResult : %s'%str.encode('utf-8'))
        
        for x in [u'三峡',u'导致',u'对岸']:
            self.assertTrue(x in mlist_sc,msg=('%s in list' % x).encode('utf-8'))
            
    def test_tc(self):
                
        payload_tc = '三峽河龍埔里河堤外工程施工導致河流改道，造成對岸(介壽里)土地流失'
        jr_tc = self._get_analyzer(payload_tc)
        mlist_tc = [match.value for match in jp_expr_token.find(jr_tc)]
        print('\nResult : %s'% (','.join(mlist_tc).encode('utf-8')))
        for x in [u'三峽',u'導致',u'對岸']:
            self.assertTrue(x in mlist_tc, msg=('%s in list' % x).encode('utf-8'))
                    
if __name__ == "__main__":
    unittest.main()
