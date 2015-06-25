#
# Cookbook Name:: apache-proxy
# Recipe:: apache
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# シンボリックリンクの作成
# proxy全般
# sudo ln -s /etc/httpd/mods-available/proxy.load /etc/httpd/mods-enabled/proxy.load
link "/etc/httpd/mods-enabled/proxy.load" do
   to "/etc/httpd/mods-available/proxy.load"
end

#http用
#sudo ln -s /etc/httpd/mods-available/proxy_http.load /etc/httpd/mods-enabled/proxy_http.load
link "/etc/httpd/mods-enabled/proxy_http.load" do
   to "/etc/httpd/mods-available/proxy_http.load"
end

#https用
#sudo ln -s /etc/httpd/mods-available/proxy_connect.load /etc/httpd/mods-enabled/proxy_connect.load
link "/etc/httpd/mods-enabled/proxy_connect.load" do
   to "/etc/httpd/mods-available/proxy_connect.load"
end

#sudo ln -s /etc/httpd/mods-available/proxy_ftp.load /etc/httpd/mods-enabled/proxy_ftp.load
link "/etc/httpd/mods-enabled/proxy_ftp.load" do
   to "/etc/httpd/mods-available/proxy_ftp.load"
end

#sudo ln -s /etc/httpd/mods-available/proxy_balancer.load /etc/httpd/mods-enabled/proxy_balancer.load
link "/etc/httpd/mods-enabled/proxy_balancer.load" do
   to "/etc/httpd/mods-available/proxy_balancer.load"
end

template "httpd-proxy.conf" do
  path "/etc/httpd/conf.d/httpd-proxy.conf"
  source "httpd-proxy.conf.erb"
  owner "root"
  group "root"
  mode 0644
end

template "httpd-info.conf" do
  path "/etc/httpd/conf.d/httpd-info.conf"
  source "httpd-info.conf.erb"
  owner "root"
  group "root"
  mode 0644
end

service "httpd" do
  action :restart
end
