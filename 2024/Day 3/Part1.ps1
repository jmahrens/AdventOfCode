$Content = Get-Content .\Input.txt

$Expression1 = "mul\(([0-9]|[0-9][0-9]|[0-9][0-9][0-9]),([0-9]|[0-9][0-9]|[0-9][0-9][0-9])\)"
$matches = [regex]::Matches($content, $Expression1)

$result = @()
foreach ($match in $matches) {
    $result += "{0},{1}" -f $match.Groups[1].Value, $match.Groups[2].Value
}

$sum = 0
foreach ($r in $result){
    [int]$a,[int]$b = $r -split ","
    $sum += $a * $b
}
$sum