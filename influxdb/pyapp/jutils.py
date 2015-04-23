#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
import requests,io,json,shutil,hashlib,csv
from datetime import datetime
from StringIO import StringIO

def hashHexMd5Utf8(str):
    return hashlib.md5(str.encode('utf-8')).hexdigest()

def jdump(obj):
    return json.dumps(obj, indent=4, ensure_ascii=False, encoding='utf8')

def jload(json_path):
    fp = open(json_path, 'r')
    return json.load(fp, encoding='utf8')

def jwrite(filename, obj):
    jdumpStr = jdump(obj)
    with io.open(filename, 'w', encoding='utf8') as fr:
        fr.write(jdumpStr)

def jwriteWithDateTag(parentDir, filenameWithoutExt, obj):
    pathpref = parentDir+filenameWithoutExt
    jwrite(pathpref+'.json',obj)
    shutil.copy(pathpref+'.json',pathpref+'-D'+getDateNowTag()+'.json')

def getHttpJson(url):
    r = requests.get(url)
    r.encoding = 'utf-8'
    return r.json()

def getHttpCsv(url):
    r = requests.get(url)
    r.encoding = 'utf-8'
    return r.text.splitlines()

def getDateNowTag():
    i = datetime.now()
    return i.strftime('%Y%m%d')

def getDateTimeNowTag():
    i = datetime.now()
    return i.strftime('%Y%m%d-%H%M%S')
