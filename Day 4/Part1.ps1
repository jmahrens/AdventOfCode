$Day4Input = Get-Content -Path 'F:\AdventOfCode\Day 4\Day4Input.txt'
#Split Input from pairs into single items
$EachElf = $day4input -split ","
$ReasignElfCount = 0
#Iterate every 2 items on list
for($i =0;$i -lt $EachElf.Count;$i += 2){
    #Create two ranges by splitting into a range
    $ElfRange1 = ($EachElf[$i] -split '-')[0]..($EachElf[$i] -split '-')[1]
    $ElfRange2 = ($EachElf[($i+1)] -split '-')[0]..($EachElf[($i+1)] -split '-')[1]
    #Compare elf 1 to elf 2
    $ComparedTasks = [array](Compare-object $elfrange1 $elfrange2 -ExcludeDifferent -IncludeEqual)
    #If the number of comparisions equal the amount in either elf1 or elf2 add to Reassignment count
    if ( $ComparedTasks.count -eq $elfrange1.count -or $ComparedTasks.count -eq $elfrange2.count){
        $ReasignElfCount++
    }
}
Write-host $ReasignElfCount
