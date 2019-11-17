$viserver = Connect-VIServer -Server 192.168.229.146 -User administrator@vsphere.local -Password P@ssw0rd
$hostserver = Get-VMHost 192.168.229.145

$numHostCpu = $hostserver.numCpu

$vms = $hostserver|get-vm

$vmcpucount_total = 0

Foreach ($vm in $vms)
{
  #write-host $vm.name
  $vmcpucount_total = $vmcpucount_total + ($vm.NumCpu * $vm.CoresPerSocket)
}
$vcpuRatio = $vmcpucount_total / $numHostCpu

write-host "Num CPU: " $numHostCpu
write-host "Num vCPU: " $vmcpucount_total
write-host "vCPU Ratio: " $vcpuRatio

Disconnect-VIServer -Server * -Force -Confirm:$false
