#PowerShell ile networkte açık portları tarayalım. 
Test-NetConnection -ComputerName 1.11.1.1 -Port 12 
#$MS = Read-Host "IP Giriniz"
$IP = "192.168.1.84","10.25.10.45"
$PORT = "3389"

foreach ($item in $IP)
{
    $Tcp = Test-NetConnection -ComputerName $item -Port $PORT 
    if($Tcp.TcpTestSucceeded -eq $true){
        Write-Host "$($PORT) - $($IP) açıktır."
    }
}


#Disk boyutlarını html formatında raporlayan ve mail atan scripti yazalım. Windows makine. 
$HTML_Disk = Get-Disk | Select-Object -Property FriendlyName,@{
    n='SizeGB';
    e={
        $PSItem.Size / 1GB
    }
} | ConvertTo-Html  | Out-File -FilePath C:\temp\Demo.html

Send-MailMessage -From ercanesee@gmail.com -Body $HTML_Disk -BodyAsHtml `
-to ercan.ese@bilgeadam.com -Subject "HTML Disk Report" -SmtpServer owa.bilgeadam.com -Port 443

#Powershell ile bir wep api üzerinde post ve get işlemleri gerçekleştirelim. 
$URL = "https://reqres.in/api/users?page=2"
$Result = Invoke-RestMethod -Method GET -Uri $URL
$Result.data 

$Post_URL = "https://reqres.in/api/users"

$Request = '
    "name": "morpheus",
    "job": "leader"
}'

$bRequest = @{
    "name" = "ercan"
    "job"  = "manager"
} | ConvertTo-Json


Invoke-RestMethod -Method POST -Uri $Post_URL -Body $bRequest

#Istanbul, Ankara ve İzmir hava durumlarını ayrı ayrı bir txt üzerinde tutan sripti yazalım.
curl --request GET \
  --url 'https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=ankara' \
  --header 'authorization: apikey 6oDvZosUGTwD4zJsygz1NF:7sY7If5yL6jHm4hfMCTDC8' \
  --header 'content-type: application/json'

$Header = @{
    "authorization" = "apikey 6oDvZosUGTwD4zJsygz1NF:7sY7If5yL6jHm4hfMCTDC8"
    "content-type"  = "application/json"
}
$weatherURL = "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=ankara"

$Cities = "istanbul","ankara","izmir"

foreach ($item in $Cities)
{
    $weatherURL = "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$item"
    $WResult = Invoke-RestMethod -Method Get -Uri $weatherURL -Headers $Header
    
    $FileName = "$item" + ".txt"

    $WResult.result | Out-File -FilePath C:\temp\YPBA\Odev\$FileName

   
}

#Bir lokasyondaki 10 günden eski olan dosya ve klasörleri farklı bir klasöre taşıyan scripti yazalım.
$Source = "C:\temp\"
$Day = 10

$CutOfDate = (Get-Date).AddDays(-$Day)

$FResult = Get-ChildItem -Path $Source | Where-Object {$PSItem.LastWriteTime -le $CutOfDate}

foreach ($item in $FResult)
{
    Copy-Item -Path $item.FullName -Destination C:\temp\Demos\
}


#PowerShell ile IIS üzerinde basit bir web sistesi oluşturalım.
Install-WindowsFeature -Name web-server -IncludeManagementTools

New-Item -Path C:\ -Name CustomApplication -ItemType Directory
New-Item -Path C:\CustomApplication -Name Index.html -ItemType File -Value "<h2>ERCAN ESE</h2>"

$App = New-WebAppPool -Name CustomApp 
New-Website -Name CustomApp -Port 8080 -IPAddress 10.6.26.10 -PhysicalPath C:\CustomApplication -ApplicationPool $app.name 

Stop-Website -Name CustomApp
Start-Website -Name CustomApp