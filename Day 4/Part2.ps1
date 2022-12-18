$Day4Input = Get-Content -Path 'F:\AdventOfCode\Day 4\Day4Input.txt'
#Split Input from pairs into single items
$EachElf = $day4input -split ","
$ReasignElfCount = 0
#Iterate every 2 items on list 
for($i =0;$i -lt $EachElf.Count;$i += 2){
    #Create a range for two Elves
    $ElfRange1 = ($EachElf[$i] -split '-' )[0]..($EachElf[$i] -split '-')[1]
    $ElfRange2 = ($EachElf[($i+1)] -split '-')[0]..($EachElf[($i+1)] -split '-')[1]
    #Compare Elf 1 to Elf 2
    $ComparedTasks = [array](Compare-object $elfrange1 $elfrange2 -ExcludeDifferent -IncludeEqual)
    #If any numbers overlap add to reasignment count
    if ($ComparedTasks.count -gt 0){
        $ReasignElfCount++
    }
}

Write-host $ReasignElfCount
