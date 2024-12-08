$Content = Get-Content .\Input.txt

$Expression1 = 'mul\(([0-9]|[0-9][0-9]|[0-9][0-9][0-9]),([0-9]|[0-9][0-9]|[0-9][0-9][0-9])\)'
$matches = [regex]::Matches($content, $Expression1)

$result1 = @()
foreach ($match in $matches) {
    $result1 += "mul({0},{1})" -f $match.Groups[1].Value, $match.Groups[2].Value
}

$Expression2 = '([0-9]|[0-9][0-9]|[0-9][0-9][0-9]),([0-9]|[0-9][0-9]|[0-9][0-9][0-9])'
$result2 = @()
$refined= [regex]::Matches($result, $Expression2)
foreach ($match in $matches) {
    $result2 += "{0},{1}" -f $match.Groups[1].Value, $match.Groups[2].Value
}

$sum = 0
foreach ($r in $result2){
    [int]$a,[int]$b = $r -split ","
    $sum += $a * $b
}
$sum