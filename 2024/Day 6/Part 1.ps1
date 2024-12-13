$content = Get-Content .\Example.txt

$puzzlehash = [ordered]@{}

for($y=0; $y -lt $content.Length;$y++){
    for($x=0;$x -lt $content[$y].Length;$x++){
        $puzzlehash["$x,$y"] = $content[$y][$x]
    }
}
$North = "$x,$($y-1)"
$East = "$($x+1),$y"
$South = "$x,$($y+1)"
$West = "$($x-1),$y"

$Directions = ($North, $East, $South, $West)

$Directions


<#
- Find location of '^'
- Add current location to new hashmap with visited locations; doesn't matter if it has been there multiple times
        $Visted = @{}
        $Visited[$x,$y] += 1
- Check next $Direction[Index] is blocked ('#')
    - If blocked, check $direction[Index + 1]
    - If open, record location and check next $direction
- If $null, end of map and calculate the number of keys in $visited hashmap
#>