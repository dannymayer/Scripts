# Define the target IP address and the range of ports to scan
$targetIP = "192.168.1.1"
$portStart = 1
$portEnd = 1024
# Loop through the range of ports
for ($port = $portStart; $port -le $portEnd; $port++) {
$result = Test-NetConnection -ComputerName $targetIP -Port $port -InformationLevel Quiet
# If the port is open, print a message
if ($result -eq $true) {
Write-Output "Port $port is open on $targetIP"
}
}