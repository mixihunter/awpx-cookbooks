#
# Cookbook Name:: ec2_i18n
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file '/etc/sysconfig/i18n' do
   source 'i18n.txt'
   mode 0644
   owner 'root'
   group 'root'
end
