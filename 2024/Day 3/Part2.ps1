$Content = Get-Content .\Input.txt

$Expression1 = "mul\(([0-9]|[0-9][0-9]|[0-9][0-9][0-9]),([0-9]|[0-9][0-9]|[0-9][0-9][0-9])\)|do\(\)|don't\(\)"

$values = [regex]::Matches($content, $Expression1)

$result = @()
$do = $true
for($i=0;$i -lt $values.count;$i++){

    if( $values[$i].Groups[0].Value -eq "don't()" ){
        $do = $false
    }
    elseif( $values[$i].Groups[0].Value -eq "do()" ){
        $do = $true
    }
    else{
        if($do){
            $result += "{0},{1}" -f $values[$i].Groups[1].Value, $values[$i].Groups[2].Value
        }
    }
}

$sum = 0
foreach ($r in $result){
    [int]$a,[int]$b = $r -split ","
    $sum += $a * $b
}
$sum