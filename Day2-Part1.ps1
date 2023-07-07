Get-Process | 
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
#Volumelerden sizeremaining değeri 100gb altında olan volumeleri ekranda görelim.
#Servislerdan starttype disabled olanları ekranda isme göre sıralı şekilde görelim.
#bana 127.0 ile başlamaya iplerin tamamını getirin.
#