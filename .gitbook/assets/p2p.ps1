# powershell script to initiate a remote.it P2P connection
# using connecd.exe command line options

$uid = "copy your Service's UID here"
$address = "127.0.0.1"
$port = "33001"

if($args.Length -ne 2)
{
    echo "usage: powershell .\p2p.ps1 username password"
    exit
}

$username = $args[0]
$password = $args[1]

$ubytes = [System.Text.Encoding]::UTF8.GetBytes($username)
$ub64 = [System.Convert]::ToBase64String($ubytes)

$pbytes = [System.Text.Encoding]::UTF8.GetBytes($password)
$pb64 = [System.Convert]::ToBase64String($pbytes)

Start-Process -NoNewWindow -FilePath ".\connectd.exe" -ArgumentList "-c $ub64 $pb64 $uid T$port 1 $address 12"
Start-Sleep -Seconds 10
Get-Process "connectd" > ps.txt
$cpid = Get-Content ps.txt | Where-Object{$_ -match 'connectd'} | ForEach-Object{($_ -split "\s+")[6]}

if ($cpid -ne "")
{
     echo "..."
     echo "Created a P2P connection to $uid on $address port $port."
     echo "To terminate this connection, enter:"
     echo "Stop-Process $cpid"
}
else
{
    echo "---"
	echo "connectd is not running!"
	echo "---"
}