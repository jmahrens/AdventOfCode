$Content = Get-Content .\Input.txt

$safeCount = 0

foreach ($report in $content){
    $values=@{
        positive = 0
        negative = 0
        zero = 0
        big = 0
    }
    $isSafe = $true
    $levels = $report -split " "
    for ($i=0; $i -lt ($levels.count-1);$i++){
        $difference = [int]$levels[$i] - [int]$levels[$i+1]
        switch ($difference){
            {$difference -notin -3..3}{$values["big"]++}
            {$difference -in -3..-1}{$values["negative"]++}
            {$difference -eq 0}{$values["zero"]++}
            {$difference -in 1..3}{$values["positive"]++}
        }
    }
    switch ($values){
        ({$values["positive"] -ge 1 -and $values["negative"] -eq 0 -and $values["zero"] -eq 0 -and $values["big"] -eq 0})
        { break }
        ({$values["positive"] -ge 1 -and ($values["negative"] -eq 1 -or $values["zero"] -eq 1 -or $values["big"] -eq 1)})
        { break }
        ({$values["negative"] -ge 1 -and $values["positive"] -eq 0 -and $values["zero"] -eq 0 -and $values["big"] -eq 0})
        { break }
        ({$values["negative"] -ge 1 -and ($values["positive"] -eq 1 -or $values["zero"] -eq 1 -or $values["big"] -eq 1)})
        { break }
        default{
            $isSafe = $false
        }
    }
    if ($isSafe = $true){
        $safeCount++
    }
}

Write-host "Safe count is: $safeCount"















if (($levels.count) -eq (($levels | Select-Object -Unique).count)){
        $positive = $null
        $tolerable = $true 
        for ($i=0; $i -lt ($levels.count-1);$i++){
            if ($levels[$i] - $levels[$i+1] -in -3..3){
                $difference = $levels[$i] - $levels[$i+1]
                write-host "difference equals: $difference"
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                switch ( $difference ){
                    #if the difference is positive AND there have been no errors or negative, set positive (Positive = $true)
                    # array(5,4,3,2,1); 5 - 4 = 1; set positive
                    ($difference -gt 0 -and $tolerable -eq $true){ $positive = $true; continue }
                    #if the difference is positive AND positive is false BUT there first error hasnt occured; set tolerable to false
                    # array(3,4,3,2,1); 3 - 4 = -1; 4 - 3 = 1; positive is $false, next calculation is positive; set tolerable to $false
                    ($difference -gt 0 -and $tolerable -eq $true -and $positive -eq $false){ $tolerable = $false; continue }
                    #if the difference is postiive AND positive is false AND the first error has occured; the report is unstafe ($isSafe = $false)
                    # array(3,4,3,2,1); 3 - 4 = -1; 4 - 3 = 1; 3 - 2 = 1 positive is $false,  next calculation is positive; set tolerable to $false
                    ($difference -lt 0 -and $tolerable -eq $false -and $postive -eq $true){ $issafe = $false; break}
                    #if the difference is negative AND there have been no errors or positive, set negative (Positive = $false)
                    # array(1,2,3,4,5); 1 - 2 = -1; set negative
                    ($difference -lt 0 -and $tolerable -eq $true){ $positive = $false; continue }{}
                    #if the difference is negative AND positive is set BUT the first error hasnt occured; set tolerable to false
                    ($difference -lt 0 -and $tolerable -eq $true -and $positive -eq $true){ $tolerable = $false; continue }
                    #if the difference is negative AND positive is set AND the first error has occured; the report is unsafe ($isSafe = $false)
                    ($difference -lt 0 -and $tolerable -eq $false -and $postive -eq $true){ $issafe = $false; break}
                    #if the difference is zero BUT there have been no errors; set tolerable to false
                    ($difference -eq 0 -and $tolerable -eq $true){$tolerable = $false}; continue
                    #if the difference is zeo AND there have been erros; the report is unsafe ($isSafe = $false) 
                    ($difference -eq 0 -and $tolerable -eq $true){$isSafe = $false; break}
                }
                
                
                
                
                if ($difference -gt 0) { 
                    if ($positive -eq $false){
                        $isSafe = $false
                        break
                    }
                    $positive = $true
                }
                else{ 
                    if ($positive -eq $true){
                        $isSafe = $false
                        break
                    }
                    $positive = $false
                }
            }
            else{ 
                $isSafe = $false}
            }
        }
    else { 
        $isSafe = $false
    }
    if($isSafe){
        $safeCount++}
}


