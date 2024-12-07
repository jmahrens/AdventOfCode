$InputList = Get-content 'F:\AdventOfCode\Day 1\Day1Input.txt' -Raw 
$Newline = [System.Environment]::Newline
$Output = $inputlist -split "$Newline$Newline" | ForEach-Object {($_ -split $Newline | Measure-Object -Sum).Sum}| Sort-Object -Descending
$Part1 = $Output[0]
$Part2 = $Output[0]+$Output[1]+$Output[2]
Write-Host $Part1
write-host $Part2