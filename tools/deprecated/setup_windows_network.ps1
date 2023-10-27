# Allow traffic from Hyper-V VMs to WSL and vice versa
Set-NetIPInterface -ifAlias "vEthernet (WSL)" -Forwarding Enabled
Set-NetIPInterface -ifAlias "vEthernet (Default Switch)" -Forwarding Enabled
