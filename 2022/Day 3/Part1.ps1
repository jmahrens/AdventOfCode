$Day3Input = Get-Content -Path 'F:\AdventOfCode\Day 3\Day3Input.txt'

$PriorityScore = 0

$Day3Input | ForEach-Object {
    #Find the number of charracters in the input
    $NumChar = (($_.ToCharArray()).count)
    #Find mid point to split in half
    $SplitNum = ($NumChar/2)
    #Split the characters into two halfs
    $1stHalf = $_[0..($SplitNum - 1)]
    #Second half of characters
    $2ndHalf = $_[$splitNum..($NumChar -1)]
    #Compare both halves, exclude differences to find the same character. Use [0] if the item is duplicated
    #Use [int][char] to find the integer assignment of the character A through Z 
    $WrongChar = ([int][char](compare-object $1stHalf $2ndHalf -IncludeEqual -ExcludeDifferent -CaseSensitive).inputobject[0])
    if ($WrongChar -lt [int]93){
        #If uppercase letter assign it a point value of 27-52
        $PriorityScore += ($WrongChar - 38)
    }
    else{
        #If lowercase letter assign it a point value of 1-26
        $PriorityScore += ($WrongChar - 96)
    }
}
Write-Host $PriorityScore

<#
#Find [int] value of upper/lower case letter
('A'[0]..'Z'[0])
('a'[0]..'z'[0]) 
#>

