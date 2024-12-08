$Content = Get-Content .\Input.txt

$safeCount = 0

foreach ($report in $content){
    $isSafe = $true
    $levels = $report -split " "
    if (($levels.count) -eq (($levels | Select-Object -Unique).count)){
        $positive = $null 
        for ($i=0; $i -lt ($levels.count-1);$i++){
            if ($levels[$i] - $levels[$i+1] -in -3..3){
                $difference = $levels[$i] - $levels[$i+1]
                write-host "difference equals: $difference"
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