default['PS']['Path'] = "#{Chef::Config[:file_cache_path]}\\cookbooks\\common\\files\\powershell"

default['staging-dir'] = 'C:\\Test1\\'
default['test-dir'] = 'C:\\Test2\\'

#Powershell Inputs
default['PS']['SystemLocale'] = ({
	'SystemLocale' => 'en-AU'
})

default['PS']['SetDNS'] = ({
	'InterfaceIndex' 	=> '12',
	#cant get powershell to accept this value. Look at how the script worked with Ancible
	'NewServerAddress' 	=> ['8.8.8.8', '10.10.10.10'],
	'AddressFamily' 	=> 'IPv4'
})


