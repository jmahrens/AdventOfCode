$content = Get-Content .\Example.txt

$puzzlehash = @{}

for($y=0; $y -lt $content.count;$y++){
    for($x=0;$x -lt $content[0].Length;$x++){
        $puzzlehash["$x,$y"] = $content[$y][$x]
    }
}