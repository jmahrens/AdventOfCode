$Content = Get-Content $PSScriptRoot\Input.txt

$data1 = $Content | ForEach-Object { ($_.split(' ',[System.StringSplitOptions]::RemoveEmptyEntries))[0] }
$data2 = $Content | ForEach-Object {($_ -split '\s{3,}')[1]} | Group-Object

$score = 0

foreach ($number in $data1){
    $score += [int]$number * [int]($data2 | Where-Object { $_.Name -eq $number}).count
}
Write-host $score