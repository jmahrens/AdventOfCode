$Day3Input =  Get-Content -Path 'F:\AdventOfCode\Day 3\Day3Input.txt'

$PriorityScore = 0

#Loop through list, itterate every 3 items
for($i = 0; $i -lt $Day3input.count; $i += 3){
    #Convert first three into character arrays
    $Firstpack = $Day3Input[$i].ToCharArray()
    $Secondpack = $Day3Input[($i + 1)].ToCharArray()
    $Thirdpack = $Day3Input[($i + 2)].ToCharArray()

    #Compare first list to second list
    $FirstCompare = (Compare-Object -ReferenceObject $Firstpack -DifferenceObject $Secondpack -CaseSensitive -ExcludeDifferent -IncludeEqual).inputobject
    #Compare remaing equal characters to third list
    #Use [int][char] to convert to integer
    $SecondCompare = [int][char](compare-object -ReferenceObject $FirstCompare -DifferenceObject $Thirdpack -CaseSensitive -ExcludeDifferent -IncludeEqual).inputobject[0]

    if ($SecondCompare -lt [int]93){
        #If uppercase letter assign it a point value of 27-52
        $PriorityScore += ($SecondCompare - 38)
    }
    else{
        #If lowercase letter assign it a point value of 1-26
        $PriorityScore += ($SecondCompare - 96)
    }      
}

write-host $PriorityScore