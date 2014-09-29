#!/usr/bin/env python
# -*- coding: utf-8 -*-
from flask import Flask
from flask.ext import restful
from rq_dashboard import RQDashboard
from redis import Redis
from rq import Queue
from rq.job import Job
from wordcount import count_words_at_url
import logging
import json

# set the project root directory as the static folder, you can set others.
flaskapp = Flask(__name__, static_url_path='')
api = restful.Api(flaskapp)
RQDashboard(flaskapp)
conn = Redis()
queue = Queue(connection=conn)

@flaskapp.route('/')
def index():
    return flaskapp.send_static_file('index.html')

@flaskapp.route('/hello')
def hello():
    return 'Hello World'

class QueueJob(restful.Resource):
    
    def qwordcount(self, fid , url):
        r = {}
        job = queue.enqueue(count_words_at_url, url)
        r['raw'] = job.dump()
        # dump without id ?
        r['id'] = job.id
        r['fid'] = fid
        r['url'] = url
        r['rjob'] = '/rjob/%s' % job.id
        flaskapp.logger.info(json.dumps(r,ensure_ascii=False,encoding='utf8'))
        # [rq/job.py at master · nvie/rq](https://github.com/nvie/rq/blob/master/rq/job.py)
        # new version RQ job.to_dict()
        return r
        
    
    def get(self, func_id):
        if func_id == 'count_words_at_url':
            return self.qwordcount(func_id,'http://nvie.com')
        elif func_id == 2:
            pass
        else:
            return {'error':'func_id %s not found.' % func_id}
            
class ResultJob(restful.Resource):
    def get(self, job_id):
        job = Job.fetch(job_id, connection=conn)
        r = {}
        r['id'] = job.id
        r['raw'] = job.dump()
        if(job.is_finished):
            r['result'] = job.result
        flaskapp.logger.info(json.dumps(r,ensure_ascii=False,encoding='utf8'))
        return r

api.add_resource(QueueJob, '/qjob/<string:func_id>')
api.add_resource(ResultJob, '/rjob/<string:job_id>')