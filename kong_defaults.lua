return [[
prefix = /usr/local/kong/
log_level = notice
proxy_access_log = logs/access.log
proxy_error_log = logs/error.log
admin_access_log = logs/admin_access.log
admin_error_log = logs/error.log
custom_plugins = basic-auth-trans
anonymous_reports = on

proxy_listen = 0.0.0.0:8000
proxy_listen_ssl = 0.0.0.0:8443
admin_listen = 0.0.0.0:8001
admin_listen_ssl = 0.0.0.0:8444
nginx_worker_processes = auto
nginx_optimizations = on
nginx_daemon = on
mem_cache_size = 128m
ssl = on
ssl_cert = NONE
ssl_cert_key = NONE
client_ssl = off
client_ssl_cert = NONE
client_ssl_cert_key = NONE
ssl_cipher_suite = modern
ssl_ciphers = ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256
admin_ssl = on
admin_ssl_cert = NONE
admin_ssl_cert_key = NONE
upstream_keepalive = 60
server_tokens = on
latency_tokens = on

database = postgres
pg_host = 127.0.0.1
pg_port = 5432
pg_database = kong
pg_user = kong
pg_password = NONE
pg_ssl = off
pg_ssl_verify = off
cassandra_contact_points = 127.0.0.1
cassandra_port = 9042
cassandra_keyspace = kong
cassandra_timeout = 5000
cassandra_ssl = off
cassandra_ssl_verify = off
cassandra_username = kong
cassandra_password = NONE
cassandra_consistency = ONE
cassandra_lb_policy = RoundRobin
cassandra_local_datacenter = NONE
cassandra_repl_strategy = SimpleStrategy
cassandra_repl_factor = 1
cassandra_data_centers = dc1:2,dc2:3
cassandra_schema_consensus_timeout = 10000

cluster_listen = 0.0.0.0:7946
cluster_listen_rpc = 127.0.0.1:7373
cluster_advertise = NONE
cluster_encrypt_key = NONE
cluster_keyring_file = NONE
cluster_profile = wan
cluster_ttl_on_failure = 3600

dns_resolver = NONE
dns_hostsfile = /etc/hosts

lua_code_cache = on
lua_socket_pool_size = 30
lua_ssl_trusted_certificate = NONE
lua_ssl_verify_depth = 1
lua_package_path = ?/init.lua;./kong/?.lua
lua_package_cpath = NONE
serf_path = serf
]]
