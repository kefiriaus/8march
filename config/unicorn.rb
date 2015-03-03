root = "/var/www/8march.golovkin.cc/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.8march_golovkin_cc.sock"
worker_processes 2
timeout 30
