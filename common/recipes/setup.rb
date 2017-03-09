#
# Cookbook:: common
# Recipe:: setup
#
# Copyright:: 2017, The Authors, All Rights Reserved.

#Create Staging Directory
directory node['staging-dir'] do
  action :create
end

#Powershell example with inline code - params passed in via environment
#Leave here to expain how powershell and chef work
powershell_script 'Powershell Example - Inline' do
	environment node['PS']['SetDNS']
	code <<-EOH
    $currentSetting = Get-DnsClientServerAddress -AddressFamily $env:addressFamily
    $currentSetting | Where-Object {$_.InterfaceIndex -eq $env:interfaceIndex}
  EOH
  action :run
  #not_if "Test-Path $env:dir"
end

#Powershell example with ps1 file - params passed in via environment
#TODO investigate the path var and how this works
powershell_script 'PS - Set system locale' do
	environment node['PS']['SystemLocale']
  code "#{node['PS']['Path']}\\win-locale.ps1"
  action :run
#TODO how to flag reboot
end

#Set system DNS
#TODO investigate the path var and how this works
powershell_script 'PS - Set system DNS' do
	environment node['PS']['SetDNS']
  code "#{node['PS']['Path']}\\win-dns.ps1"
  action :run
#TODO how to flag reboot
end