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
