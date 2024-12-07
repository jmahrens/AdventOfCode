<#
Bad assumstion that the input would have multiple lines of code to find 'Start-of-packet-marker'
#>

[array]$ImportContent = Get-Content 'F:\adventofcode\Day 6\Day6Input.txt'
$CodeMarker = 0
#Iterate through each line of code
:outer for ($i = 0; $i -lt $ImportContent.count; $i++){
    #Break each line to individual charaters
    $a = $ImportContent[$i].ToCharArray()
    #Iterate through each character of the line
    :inner for ($ii = 0; $ii -lt $a.count;$ii++){
        #Compare 1st letter to 2nd, 3rd, and 4th
        if ($a[$ii] -ne $a[($ii+1)] -and $a[$ii] -ne $a[($ii+2)] -and $a[$ii] -ne $a[($ii+3)] ){
            #Compare 2nd letter to 3rd and 4th
            if ($a[$ii+1] -ne $a[($ii+2)] -and $a[$ii+1] -ne $a[($ii+3)]){
                #Compare 3rd and 4th letter
                if ($a[$ii+2] -ne $a[($ii+3)]){
                    #If none match, add the character position
                    $Codemarker += ($ii + 4)
                    #Move to next line of code
                    continue outer
                }
            }
        }
    }
}
Write-Host $CodeMarker