$Content = Get-Content .\Input.txt

$Expression1 = "mul\(([0-9]|[0-9][0-9]|[0-9][0-9][0-9]),([0-9]|[0-9][0-9]|[0-9][0-9][0-9])\)"
$values = [regex]::Matches($content, $Expression1)

$result = @()
foreach ($value in $values) {
    $result += "{0},{1}" -f $value.Groups[1].Value, $value.Groups[2].Value
}

$sum = 0
foreach ($r in $result){
    [int]$a,[int]$b = $r -split ","
    $sum += $a * $b
}
$sum