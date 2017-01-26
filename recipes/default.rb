#
# Cookbook Name:: nginx_CB
# Recipe:: default
#
# Copyright 2017, Mohammad Hamdan
#
# All rights reserved - Do Not Redistribute
#
########add Nginx Repo based on OS platform and version########
case node['platform']
  when 'centos'
    if node['platform_version'].to_i == 6
      yum_repository 'nginx' do
  	description "nginx repo"
	baseurl "http://nginx.org/packages/centos/6/x86_64/"
 	action :create
      end
    elsif node['platform_version'].to_i == 7
      yum_repository 'nginx' do
  	description 'nginx repo'
  	baseurl 'http://nginx.org/packages/centos/7/x86_64/'
 	action :create
      end
    end
  when 'amazon'
    yum_repository 'nginx' do
  	description 'nginx repo'
  	baseurl 'http://nginx.org/packages/centos/6/x86_64/'
 	action :create
    end
  when 'ubuntu'
    apt_repository 'nginx' do
	uri        'ppa:nginx/stable'
    end
end
####################################################################
package node["pakage_name_nginx"] do
        action :install
end

file "/etc/nginx/nginx.conf" do
        action :delete
end

file "/etc/nginx/conf.d/virtual.conf" do
	action :delete
end

directory '/etc/nginx/cache' do
  owner 'root'
  group 'root'
  mode '0777'
  action :create
end

directory '/var/log/nginx' do
  owner 'root'
  group 'root'
  mode '0777'
  action :create
end

cookbook_file "/etc/nginx/nginx.conf" do
        source "nginx.conf"
        action :create
end

service 'nginx' do
        action [:enable, :start]
        supports :reload => true
end

