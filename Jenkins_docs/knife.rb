current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "svc_d_chef_admin"
client_key               "#{current_dir}/user.pem"
chef_server_url  "https://us-east-1.dev-chef-server.autodesk.com/organizations/autodesk"
cookbook_path           ["cookbooks"]
ssl_verify_mode          :verify_none
chef_repo_path  "/var/lib/jemkins/workspace/"