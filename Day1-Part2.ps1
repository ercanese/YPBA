Get-Service -Name ALG
Start-Service -Name ALG

Get-Service -Name ALG | Start-Service 


Get-Service -Name ALG,BITS,sense

Get-Service -Name ALG
Get-Service -Name ALG | Get-Member
Get-Process | Get-Member

Get-Service | Sort-Object -Property Status
Get-Process | Sort-Object -Property id
Get-Process | Sort-Object -Property StartTime -Descending

Get-Service | Get-Member
Get-Service | Sort-Object -Property StartType

Get-Service | Group-Object -Property Starttype

Get-Service | Group-Object -Property Status

#Makine üzerinde processleri isme göre tersten sıralayan komutu yazalım.
Get-Process
Get-Process | Sort-Object -Property ProcessName -Descending
#Makine üzerinde Firewall kurallarını enable durumuna göre guplayan komutu yazalım.
Get-NetFirewallRule | Get-Member
Get-NetFirewallRule | Group-Object -Property Enabled
#Makine üzerinde C:\ altında bulunan dosyaları son yazılma tarihine göre tersten sıralayalım.
Get-ChildItem -Path C:\ | Get-Member

Get-ChildItem -Path C:\ -Recurse | Sort-Object -Property LastWriteTime -Descending
#
Get-Service | Measure-Object
Get-NetFirewallRule | Measure-Object


Get-Service | Get-Member
Get-Service | Select-Object -Property Name,StartType,Status
Get-Process | Select-Object -Property NAme,ID,StartTime

Get-NetFirewallRule | Get-Member
get-NetFirewallRule | Select-Object -Property Status,Enabled,Name

Get-Service | Select-Object -Skip 10 -First 4 
Get-Service | Select-Object -Unique Status

#Bana ekranda sadece disklerin Size ve ismini getiren komutu yazın.
Get-Service | Select-Object  -Property Name, Size
Get-Disk | Select-Object -Property FriendlyName,Size
Get-Disk | Get-Member
#Processleri CPU değerine göre sıralayarak ekranda en çok cpu tüketen processi tek olarak görelim.
Get-Process | Sort-Object -Property CPU -Descending | Select-Object -Property Name -First 1
Get-Process | Sort-Object -Property CPU -Descending | Select-Object -Property Name -Last 1
Get-Process | Measure-Object -Property CPU -Maximum -Minimum
#Makine üzerinde bulunan ip adreslerini listeleyelim fakat ekranda sadece ip addresi görünsün.
Get-Command -Verb get -Noun "*IPAddress*"
Get-NetIPAddress -AddressFamily IPv4  | Select-Object -Property IpAddress
#

#foreach
#if
#for
#datatypes