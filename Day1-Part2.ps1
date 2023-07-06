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