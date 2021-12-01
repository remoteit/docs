# Usage

Once remoteit has been installed on the target device and the services have been configured, then you can connect to any of the services using either the Desktop, CLI, [remoteit Web Portal](https://app.remote.it), mobile applications or the API. The Desktop and CLI can support both peer to peer connections and proxy connections while the Web Portal and API can only support proxy connections.

For more on connections, please refer to the documentation for [Desktop](https://support.remote.it/hc/en-us/articles/360048935411-Connections), [remoteit Web Portal](https://support.remote.it/hc/en-us/articles/360048707812-The-Devices-Page) or the [API](../../developer-tools/api/usage/usage-examples.md).&#x20;

## Checking the Target Network&#x20;

The device package only comes with the `connectd` command and does not attempt to add this to the system PATH. All the commands are being run at the target device's network. These are initial tests to confirm the device can access remoteit's servers or other targets on the LAN.

default installation location&#x20;

{% tabs %}
{% tab title="Linux" %}
`/usr/share/remoteit/`&#x20;
{% endtab %}

{% tab title="Mac" %}
`/usr/local/bin/`
{% endtab %}
{% endtabs %}

To confirm that your network is configured correctly to allow a remote.it connection, run `connectd -n` at the command line in order to run remote.it Network Diagnostics. You may have to configure any virus checker that you are using in order to allow connectd to be run.

```
connectd -n

Running Network Diagnostics
---------------------------------
Checking if DNS works ... .[OK]
Checking TCP connectivity to remote.it...<oip=10.0.0.106> [OK]
Checking UDP connectivity to remote.it...
Send to 69.64.90.20:5959 [] [mip=##.##.###.###] [oport=59450 mport=59450] [preserve port] 
Send to 69.64.90.20:5960 [] [mip=##.##.###.###] [oport=59450 mport=59450] [no remap] [preserve port] 
Send to 69.64.90.128:5961 [] [mip=##.##.###.###] [oport=59450 mport=59450] [no remap] [preserve port different IP] [OK]
Checking if NAT-PMP Router is found...[NOT FOUND]

This router preserves ports, this is optimal.
This router doesn't remap new connections to new ports.
Endian : Little
SHA1 test:
  passed.
RC4 test:
  passed
XXTEA test:
  passed.
Looks compatible.
```

To do additional confirmation that remote.it has consistent connectivity and will not provide inaccurate offline events run `connectd -nat`. 30 seconds is disirable.&#x20;

```
connectd -nat

Running Nat UDP Reply Timeout Checker
-------------------------------------
Checking 1 seconds on port 64968 (54.245.28.114)[good reply at 1 seconds] 
Checking 2 seconds on port 62130 (54.245.28.114)[good reply at 2 seconds] 
Checking 4 seconds on port 63878 (54.245.28.114)[good reply at 4 seconds] 
Checking 8 seconds on port 59889 (54.245.28.114)[good reply at 8 seconds] 
Checking 16 seconds on port 64141 (54.245.28.114)[good reply at 16 seconds] 
Checking 32 seconds on port 64688 (54.245.28.114)[Failed at 32 seconds] 
Checking 24 seconds on port 51136 (54.245.28.114)[good reply at 24 seconds] 
Checking 28 seconds on port 50498 (54.245.28.114)[good reply at 28 seconds] 
Checking 30 seconds on port 60809 (54.245.28.114)[good reply at 30 seconds] 
Checking 31 seconds on port 52161 (54.245.28.114)[Failed at 31 seconds] 
Calculated NAT map time is 30 seconds exiting.

Running UDP Nat MAP Timeout Checker
---------------------------------
Setting up NAT mapping
[mip=##.##.###.###] [oport=55156 mport=55156] Trying for 120 seconds
testing mapping (54.245.28.114)..[mapping invalid was 55156 now 55156] [new timeout to try 60]
Trying for 60 seconds
testing mapping (54.245.28.114)..[mip=24.13.204.189] [oport=55156 mport=55156] [mapping still at 55156] [increase timeout to 90 ]
Trying for 90 seconds
testing mapping (54.245.28.114)..[mapping invalid was 55156 now 55156] [new timeout to try 75]
Trying for 75 seconds
testing mapping (54.245.28.114)..[mapping invalid was 55156 now 55156] [new timeout to try 67]
Trying for 67 seconds
testing mapping (54.245.28.114)..[mapping invalid was 55156 now 55156] [new timeout to try 63]
Trying for 63 seconds
testing mapping (54.245.28.114)..[mapping invalid was 55156 now 55156] [new timeout to try 61]
Trying for 61 seconds
testing mapping (54.245.28.114)..search completed NAT timeout calculated to ~60 seconds, exit
```

To check accessible addresses from the target device use `connectd -nc <server:port>`. This command tests if we can open a tcp port to specified server

```
connectd -nc google.com:80

Connectivity Check
SUCCESS Connect to google.com:80
```
