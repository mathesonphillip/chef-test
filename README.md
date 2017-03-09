# bluedoor-chef

Common Commands to run


Run defualt recipe in cookbook
chef-client --config ./config.rb -r "common"

Run recipe in cookbook
chef-client --config ./config.rb -r "common::setup"


chef-client --config ./config.rb --format summary --force-formatter -r "common::setup"


***PS C:\Users\Administrator\github\bluedoor-chef\cookbooks> chef-client --config ./config.rb -Fnyan -lfatal -r "common::setup"


Get arributes from ohai
PS> ohai network/interfaces/0xc/dns_server_searh_order



I wasn’t able to use Ruby variable substitution directly in a PowerShell cmdlet, so you see a stylistic no-no: the assignment to a variable used in the cmdlet ($winfeat = '#{feat}'),



Steps
Installed https://github.com/andreacampi/nyan-cat-chef-formatter


Several ways to execute powershell... which is best....
Splat seems to be the best and doesn't write to environment
Environment - tightly coupled with 



#TODO
Would like to add a custom formatter
Add c:\users\administrator\appdata\local\chefdk\gem\ruby\2.3.0\bin to path for custom formatter
Add cache to gitigone
Cant get DNS ip to work with PS