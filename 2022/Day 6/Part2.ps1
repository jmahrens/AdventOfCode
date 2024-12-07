<#
Reconfigured part2 based on github.com/kjp148's submission
#>
[array]$ImportContent = Get-Content 'F:\adventofcode\Day 6\Day6Input.txt'

$MessageMarker = 0
#Break message into character array
$MessageArray = $ImportContent.ToCharArray()

#Start at 13th letter and iterate through rest of list
for ($i = 13; $i -lt $MessageArray.count; $i++){
    #If no solution found (-lt 1) and the range of 14 letters are unique
    If ($MessageMarker -lt 1 -and ($MessageArray[($i - 13).. $i] | Select-object -Unique).Length -eq 14){
        #Write the index of the successful 14th unique character
        Write-host "Message Marker: $($i+1)"
        $MessageMarker ++
    }
    #If one unique string is found, stop loop
    if($MessageMarker -eq 1){break}
    
}
