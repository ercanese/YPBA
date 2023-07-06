get-service -Name KeyIso -DependentServices

Get-EventLog -LogName Application
Get-EventLog

Get-Service -Name ALG
Stop-Service -Name ALG
Start-Service -Name ALG



#Bana makine üzerinde Winrm,ALG,BITS ve wuauserv servislerini ekranda gösteren cmdleti yazın.
Get-Service -Name ALG,BITS,Winrm,Wuauserv
#BITS Servisini durduralım ve tekrar powershell ile başlatalım.
Get-Service -Name BITS
Stop-Service -Name BITS 
Start-Service -Name BITS
#BITS Servisinin Set komutu ile StarTtype değerini Automatic olarak güncelleyelim.
Set-Service -Name BITS -StartupType Automatic


Get-Help
Get-Help -Name get-service
Get-Help -Name Set-Service -Examples

Get-Help -Name Set-Service -Full


Get-Help -Name Stop-Process -Full

Stop-Process -Name notepad

$env:COMPUTERNAME
$env:PSModulePath

Get-Module
Get-Module -ListAvailable
Get-NetIPAddress

New-AzSignalR

Install-Module -Name SqlServer


Get-Command -Verb get -Noun *IpAddress*
Get-Help -Name Get-NetIPAddress -Full

Get-NetIPAddress
Get-Command -Module SqlServer

Get-Command -Verb Get -Noun *Firewall*

Get-Command -Name *firewall*

Get-NetFirewallRule


#Makine üzerinde dnscacheleri listeleyen komutu bularak calıstırın.
Get-Command -Verb get -Noun "*cache*"
Get-DnsClientCache
#Makine üzerinde diskleri listeleyen komutu bulun ve çalıştırın.
Get-Command -Verb get -Noun *disk*
Get-Disk
Get-PhysicalDisk 

#Makine üzerinde Volumeleri listeyen komutu bulun ve çalıştırın.
Get-Command -Verb get -Noun "*volume*"
Get-Volume

#C:\ altına Temp3 adında bir directory item olusturan cmdleti yazın.

Get-Command -Verb * -Noun *Item*
Get-Command -Verb new -Noun *Item*

Get-Help -Name new-item -full

New-Item -Path C:\ -Name Temp3 -ItemType Directory
#Olusturdugunuz bu klasörü powershell ile silen komutu bulun ve calıstırın.
Remove-Item -Path C:\Temp3 

Get-Service