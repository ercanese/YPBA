﻿Get-Process | 
    Select-Object -Property Name,CPU,@{
        n='CPUx2';
        e={$PSItem.cpu * 5}
    }
    
Get-Process |  Select-Object -Property Name,@{
    n='ID-10';
    e={
        $PSItem.name.toupper()
    }
}

#Volume üzerinde bulunan size ve sizeremaining değerleriniğ gb cinsinden görelim.
Get-Volume | Select-Object -Property DriveLetter,Size,SizeRemaining



Get-Volume | Select-Object -Property DriveLetter, Size, SizeRemaining, @{
        n='Size (GB)';
        e={$PSItem.Size/1GB}
    },
    @{
        n='SizeRemaining (GB)';
        e = {$PSItem.SizeRemaining/1GB}
    }


get-volume | Select-Object -Property driveletter,size,sizeremaining,@{
    n="sizeremainingçevirme";
    e={$PSItem.sizeremaining/1GB};
},@{
n="size çevirme";
e={($PSItem.size/1GB)};
}



1GB
1TB
1MB





<#
@{
    n='';
    e={}
}
#>




New-TimeSpan -Start (Get-Date) -End "6/18/2022  11:24 PM" | Select-Object -ExpandProperty Days
(New-TimeSpan -Start (Get-Date) -End "6/18/2022  11:24 PM").Days
Get-Service -Name ALG | Select-Object -ExpandProperty Name


(Get-Service -Name ALG).Name

Get-ChildItem -Path C:\ -Directory | Select-Object -Property Name,FullName,LastWriteTime,@{
    n='FolderAge';
    e={
        (New-TimeSpan -Start (Get-Date) -End $psitem.LastWriteTime).Days
    }

}

#Bana makinede çalışan processlerin kac dakikadır çalıştıgını bulan komutu yazın.

Get-Process | Get-Member
Get-Process | Select-Object -Property NAme,StartTime

Get-Process  | 
    Select-Object -Property Name,StarTime,@{
        n='ProcessAge';
        e={
            (New-TimeSpan -Start $PSItem.Starttime -End (Get-Date) ).TotalMinutes
        }
    }


#Filtreleme objesi
Where-Object
"Ercan" -eq "Ercan"
"Ercan" -ceq "ercan"

10 -gt 11
10 -lt 11

"Ercan" -like "*c*"
"Ercan" -notlike "*c*"

Get-Service |
    Where-Object {$PSItem.Status -eq "Stopped"}

Get-Service | Where-Object {
    $PSItem.Name -eq "ALG"
}

Get-Service -Name ALG
#Bana cpu değeri 10dan büyük olanları isme göre sıralayarak ekranda sadece name cpu değeri olacak sekilde görelim.
Get-Process | 
    Where-Object {$PSItem.CPU -gt 10} | Sort-Object -Property Name |
        Select-Object -Property Name,cpu


#Volumelerden sizeremaining değeri 100gb altında olan volumeleri ekranda görelim.
Get-Volume |
    Where-Object {
        $PSItem.SizeRemaining -lt 100gb
    }

#Servislerden starttype disabled olanları ekranda isme göre sıralı şekilde görelim.
Get-Service | 
    Where-Object {
        $PSItem.StartType -eq "Disabled"
    } | Sort-Object -Property Name | Select-Object -Property Name,StartType

#bana 127.0 ile başlamayan iplerin tamamını getirin.
Get-NetIPAddress | Where-Object {$PSItem.IPAddress -notlike "127.0*"} | Select-Object -Property ipaddress
Get-NetIPAddress | Where-Object {$PSItem.IPAddress -notlike "127.0.*"} | Select-Object -Property IPAddress


Get-Service | Where-Object {
    $PSItem.StartType -eq "Automatic"
} | Where-Object {
    $PSItem.Status -eq "Stopped"
}

Get-Service | Where-Object {
    $PSItem.Status -eq "Stopped" -and $PSItem.StartType -eq "Automatic"
}

Get-Service | 
    Where-Object {$PSItem.StartType -eq "Disabled" -or $PSItem.StartType -eq "Automatic"} |
        Out-File -FilePath C:\temp\YPBA\output\Servisler.txt

Get-Service | Where-Object {
    $PSItem.Status -eq "Stopped" -and $PSItem.StartType -eq "Automatic"
} | Export-Csv -Path C:\temp\YPBA\output\Demo.csv 


Get-Service | Where-Object {
    $PSItem.Status -eq "Stopped" -and $PSItem.StartType -eq "Automatic"
} | Select-Object -Property Name,StartType,Status | ConvertTo-Json | 
    Out-File -FilePath C:\temp\YPBA\output\Servisler.json



"ufuk" | Out-File -FilePath C:\temp\YPBA\output\deneme.txt
"ufuk" | Export-Csv -Path C:\t\dsd.cx


$YPNames = "Serhat"
$Num1 = 10
$Num2 = 20

$Toplam = $Num1 + $num2
$YPSurNames = "SALMAN"

$FullName = $YPNames + " " + $YPSurNames

$ALG = Get-Service -Name ALG
(Get-Service -Name ALG).Name
$ALG.Name

Write-Host "$($ALG.Name)" #-ForegroundColor Red -BackgroundColor Cyan
$ALG = $null

#2 adet değişken oluşturalım 1 tanesinin değeri 100 diğerinin değeri 150 olsun
#Bu iki değişkeni çarparak toplam değişkenine eşitleyelim.
$Sayi1 = 100
$Sayi2 = 150

$T = $Sayi1 * $Sayi2

#LogPath adında bir değişken oluşturalım ve içerisine C:\Windows pathini tanımlayalım.

$LogPath = "C:\Windows"

#En çok cpu tüketen proccesi bularak bir değişkende tutalım ve erkanda o processin sadece cpu değerini
#yalın halde kırmızı olarak gösterelim.


$Y3 = Get-Process | Sort-Object CPU -Descending | Select-Object -First 1 -ForegroundColor Red

$CPU = Get-Process | Sort-Object -Property CPU -Descending | Select-Object -Property CPU,Name -First 1
Write-Host "$($CPU.CPU)" -ForegroundColor Red


$LogPath.GetType()
$Sayi1.GetType()
[datetime]$today = "07/07/2023"

[int]$Naber = "Benbir sayıyım haha"

[int]$D = "10"
$d.GetType()

$today | Get-Member

$today.DayOfYear
$today | Get-Member
$today.AddDays(-10)


$Email = "ercan.ese@bilgeadam.com"
$Email | Get-Member
$Email.Split('@')

$LogPath = "C:\Windows"
$LogPath = $LogPath.Replace("C:","D:")


$Names = "Yekta","Ercan","Serhat","Baris"
$Names.GetType()

$Services = Get-Service 
$Services.GetType()

$N = "",""
$N = @("","")
$N = @()

$N = $N + "Demo2"

$N += "Demo6"

$Services[2].Name
$Services |Select-Object -First 1


#Bana meyveler adında bir dizi oluşturun ve içerisine Elma,Armut,Muz,Kiraz değerlerini ekleyin
$Meyveler = "Elma","Armut","Muz","Kiraz"
#Eklediğiniz bu değerlerden 3. Indexdeki elemanı ekrana yazdırın.
$Meyveler[2]
$Meyveler | Select-Object -First 1 -Skip 2
#Elemanları ekledikten sonra Ahududu meyvesinide bu diziye dahil edin.
$Meyveler += "Ahududu"
#Ekranda Kiraz meyvesi Kırmızı olarak yazılacak sekilde bir komut yazalım.
$Meyveler | Where-Object {$PSItem -eq "Kiraz"}
$Meyveler[3]
Write-Host "$($Meyveler[3])" -ForegroundColor Red
Write-Host "$($Meyveler | Where-Object {$PSItem -eq "Kiraz"})" -ForegroundColor Red