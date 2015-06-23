#
# Cookbook Name:: ec2_timezone
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#タイムゾーンを「UTC」から「Japan」に変更

# sudo /bin/ln -s /usr/share/zoneinfo/Japan /etc/localtime
link "/etc/localtime" do
   to "/usr/share/zoneinfo/Japan"
end

cookbook_file '/etc/sysconfig/clock' do
   source 'clock.txt'
   mode 0644
   owner 'root'
   group 'root'
end
