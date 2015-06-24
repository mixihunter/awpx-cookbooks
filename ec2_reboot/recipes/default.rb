#
# Cookbook Name:: ec2_reboot
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

reboot "app_requires_reboot" do
  action :request_reboot
  reason "Need to reboot when the run completes successfully."
  delay_mins 5
end
