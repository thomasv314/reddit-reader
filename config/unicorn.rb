@dir = "/app"

worker_processes 2
working_directory @dir

timeout 30

listen 8080

pid "#{@dir}/tmp/unicorn.pid"
