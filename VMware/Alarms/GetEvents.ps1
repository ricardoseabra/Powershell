$viserver = Connect-VIServer -Server 192.168.229.146 -User administrator@vsphere.local -Password P@ssw0rd
$report = @()
$eventMgr = Get-View EventManager
$eventMgr.Description.EventInfo | %{
$row = "" | Select Name, Category, Description
$row.Name = $_.Key
$row.Category = $_.Category
$row.Description = $_.Description
$report += $row
}
$report | Export-Csv "C:\events.csv" -NoTypeInformation -UseCulture
Disconnect-VIServer -Server * -Force -Confirm:$false
