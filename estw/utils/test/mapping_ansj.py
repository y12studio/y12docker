#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
import logging
import sys, argparse, os
import json
from elasticsearch import Elasticsearch

class FooIndex():
    
    def __init__(self):
        self.eshost = "localhost"
        self.esindex = 'fooindex'
        self.estype = 'fulltext'
        self.script_dir = os.path.dirname(__file__)
        self.file_mapping = os.path.join(self.script_dir, 'mapping_fooindex.json')
        self.file_content = os.path.join(self.script_dir, 'content_fooindex.json')
    
    def esimport(self):
        es = Elasticsearch([{'host': self.eshost, 'port': 9200}])
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


def main():
    parser = argparse.ArgumentParser(description='make a foo app')
    parser.add_argument('-i', '--path', help='Input directory', required=True)
    parser.add_argument('-w', '--hostpath', help='Host path', required=True)
    args = parser.parse_args()

   
if __name__ == '__main__':
    main()
