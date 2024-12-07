$ImportContent = Get-Content "F:\AdventofCode\Day 5\Day5Input.txt"
$MoveCommands = $ImportContent[(5..$ImportContent.Count)]

$MoveCommands | ForEach-Object {
    $NumberBlockPickup = ((($_ -split 'from')[0]).Split((" "))[1])
    $RemoveColumn = ((($_ -split 'from')[1]).Split("to")[0])
    $AddColumn = ((($_ -split 'from')[1]).Split("to")[2])
    Write-Host "Number of blocks to pickup $numberblockpickup from $RemoveColumn to $AddColumn"
}

$Grid = $ImportContent[(0..3)]
$Gridarray = @()
$GridArray += @{
    First = 1,3
    Second = 3
    Thrid = 2,53
}