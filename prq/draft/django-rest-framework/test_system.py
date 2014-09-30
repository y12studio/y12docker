import json
import time
import unittest
import redis
import redis.exceptions
import requests.exceptions
from requests import put, get

#from requests.exceptions import ConnectionError

class TestRq(unittest.TestCase):

    def setUp(self):
        pass

    def test_qjob_unknow_words(self):
        obj = {'url':'http://y12.tw/wp/'}
        r = self._jsonput('http://localhost:8080/qjob/count_words_at_url', obj)
        self.assertTrue('id' in r)
        self.assertTrue('url' in r)
        self.assertEquals(obj['url'], r['url'])

    def test_qjob_hello_words(self):
        obj = {'url':'http://localhost:8080/hello'}
        r = self._jsonput('http://localhost:8080/qjob/count_words_at_url', obj)
        self.assertTrue('id' in r)
        self.assertTrue('rjob' in r)
        
        count = -1
        for i in range(6):
            time.sleep(1)
            getr = get('http://localhost:8080%s' % r['rjob']).json()
            if 'result' in getr :
                count = getr['result']
                break
        self.assertEquals(2, count)        
        
    def _jsonput(self, url, obj):
        headers = {'content-type': 'application/json'}
        jdata = json.dumps(obj, ensure_ascii=False, encoding='utf8')
        return put(url, data=jdata, headers=headers).json()
        
class TestDrf(unittest.TestCase):

    def setUp(self):
        pass

    def test_get_users(self):
        r = get('http://localhost:8080/users/').json()
        print(r)
        self.assertTrue(len(r)>0)
        user = r[0]
        self.assertTrue('url' in user)
        self.assertTrue('username' in user)
        # http://192.168.2.73:8980/users/1/
        u1 = get('http://localhost:8080/users/1/').json()
        self.assertTrue('url' in u1)
        self.assertTrue('username' in u1)
        self.assertTrue('is_staff' in u1)

class TestHttp(unittest.TestCase):

    def setUp(self):
        pass

    def test_http(self):
        r = get('http://localhost:8080/')
        self.assertEquals(200,r.status_code)
        # self.assertEquals(u'Hello World',r.text)
        
    def test_http_wrong_port(self):
        # r = get('http://localhost:5000/todo1').json()
        self.assertRaises(requests.exceptions.ConnectionError, get, 'http://localhost:5000/haha')

class TestRedis(unittest.TestCase):

    def setUp(self):
        pass

    def test_redis(self):
        r = redis.StrictRedis(host='localhost', port=6379, db=0)
        resultSet = r.set('foo', 'bar')
        self.assertTrue(r.set('foo','bar'))
        self.assertEquals('bar',r.get('foo'))

    def test_redis_wrong_port(self):
        r = redis.StrictRedis(host='localhost', port=8080, db=0)
        self.assertRaises(redis.exceptions.ConnectionError, r.set, 'foo','bar')

if __name__ == "__main__":
    unittest.main()
