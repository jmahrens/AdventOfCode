$content = Get-Content .\Example.txt

$puzzlehash = @{}

for($y=0; $y -lt $content.Length;$y++){
    for($x=0;$x -lt $content[$y].Length;$x++){
        $puzzlehash["$x,$y"] = $content[$y][$x]
    }
}

