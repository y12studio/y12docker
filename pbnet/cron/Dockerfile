FROM y12docker/apbase:1505
RUN pip install schedule
ADD cron.py /app/
RUN chmod u+x /app/cron.py
CMD ["python","-u","/app/cron.py"]
