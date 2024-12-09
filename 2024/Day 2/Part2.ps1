#$Content = Get-Content .\Input.txt
$Content = Get-Content .\Example.txt
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
    switch -wildcard ($values){
        ({$_.positive -ge 1 -and $_.negative -eq 0 -and $_.zero -eq 0 -and $_.big -eq 0})
        { break }
        ({$_.positive -ge 1 -and ($_.negative -eq 1 -or $_.zero -eq 1 -or $_.big -eq 1)})
        { break }
        ({$_.negative -ge 1 -and $_.positive -eq 0 -and $_.zero -eq 0 -and $_.big -eq 0})
        { break }
        ({$_.negative -ge 1 -and ($_.positive -eq 1 -or $_.zero -eq 1 -or $_.big -eq 1)})
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