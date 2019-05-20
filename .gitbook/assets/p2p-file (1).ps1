# powershell script to initiate a remote.it P2P connection
# using a provisioning file

if($args.Length -ne 1)
{
    echo "usage: powershell .\p2p.ps1 <provisioning file name>"
    exit
}
$filename = $args[0]
echo "Filename: $filename"

Start-Process -NoNewWindow -FilePath ".\connectd.exe" -ArgumentList "-f $filename"
Start-Sleep -Seconds 10
Get-Process "connectd" > ps.txt
$cpid = Get-Content ps.txt | Where-Object{$_ -match 'connectd'} | ForEach-Object{($_ -split "\s+")[6]}

if ($cpid -ne "")
{
     echo "..."
     echo "Created a P2P connection..."
     echo "To terminate this connection, enter:"
     echo "Stop-Process $cpid"
}
else
{
    echo "---"
	echo "connectd is not running!"
	echo "---"
}