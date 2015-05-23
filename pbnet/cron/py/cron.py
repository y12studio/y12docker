#!/usr/bin/env python
import time
import logging
from datetime import datetime
from schedule import Scheduler

class TaskScheduler(Scheduler):
  """
  An implementation of Scheduler that catches jobs that fail, logs their
  exception tracebacks as errors, optionally reschedules the jobs for their
  next run time, and keeps going.

  Use this to run jobs that may or may not crash without worrying about
  whether other jobs will run or if they'll crash the entire script.
  """

  def __init__(self, reschedule_on_failure=True):
    """
    If reschedule_on_failure is True, jobs will be rescheduled for their
    next run as if they had completed successfully. If False, they'll run
    on the next run_pending() tick.
    """
    self.reschedule_on_failure = reschedule_on_failure
    Scheduler.__init__(self)

  def _run_job(self, job):
    try:
      Scheduler._run_job(self, job)
    except Exception:
      logging.exception("Exception:")
      job.last_run = datetime.now()
      job._schedule_next_run()

def job3():
    print("JOB TYPE3 %s" %  str(datetime.now()))

def job5():
    print("JOB TYPE5 %s" % str(datetime.now()))

def bad_task_1():
    print('Bad Task 1')
    print(1/0)

scheduler = TaskScheduler()
scheduler.every(300).seconds.do(job3)
#scheduler.every(5).seconds.do(job5)
#scheduler.every(7).seconds.do(bad_task_1)

while True:
    scheduler.run_pending()
    time.sleep(1)
