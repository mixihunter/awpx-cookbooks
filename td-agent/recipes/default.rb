#
# Cookbook Name:: td-agent
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file '/etc/yum.repos.d/td.repo' do
   source 'td.repo.txt'
   mode 0644
   owner 'root'
   group 'root'
end

package 'td-agent' do
   action :install
end

directory "/var/log/td-agent" do
   owner 'td-agent'
   group 'td-agent'
   mode '0755'
   action :create
end

directory "/etc/td-agent/conf.d" do
   owner 'td-agent'
   group 'td-agent'
   mode '0755'
   action :create
end

cookbook_file '/etc/td-agent/td-agent.conf' do
   source 'td-agent.conf.txt'
   mode 0644
   owner 'root'
   group 'root'
end

cookbook_file '/etc/td-agent/conf.d/proxy_log.conf' do
   source 'proxy_log.conf.txt'
   mode 0644
   owner 'root'
   group 'root'
end

service "td-agent" do
  action [ :enable, :start ]
end
