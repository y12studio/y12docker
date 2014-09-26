input {
  redis { 
          host => "IP_REDIS_TO_ALTER" 
          data_type => "pattern_channel"
          key => "logstash*"
        }
        
  file{
     type => "nginx-access"
     path => "/var/log/nginx/kibana.access.log"
     sincedb_path => "/opt/log/.sincedb"
  }
  
  file {
    type => "syslog"
    sincedb_path => "/opt/home/.sincedb" 
    path => [ "/var/log/messages", "/var/log/syslog", "/var/log/auth.log"]
    start_position => "beginning"
  }
}

filter {
   if [type] == "nginx-access" {
     grok {
       match => { "message" => "%{NGINXACCESS}" }
       patterns_dir => ["/opt/logstash/patterns/"]
     }
  }
  
  if [type] == "syslog" {
      grok {
        match => { "message" => "%{SYSLOGTIMESTAMP:syslog_timestamp} %{SYSLOGHOST:syslog_hostname} %{DATA:syslog_program}(?:\[%{POSINT:syslog_pid}\])?: %{GREEDYDATA:syslog_message}" }
      }
      syslog_pri { }
      date {
        match => [ "syslog_timestamp", "MMM  d HH:mm:ss", "MMM dd HH:mm:ss" ]
      }
   }
}

output {
  elasticsearch { host => "127.0.0.1" }
  stdout { codec => rubydebug }
}