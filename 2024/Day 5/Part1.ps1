function Test-RuleOrder{
    param(
        [Hashtable]$rules,
        [string[]]$Instructions
    )
    #Iterate through all the hash's keys
    foreach ($rule in $rules.Keys){
        #Only test if there is a hashkey used in the jobs array
        if($jobs -contains $rule){
            #Set the position of hashkey within the jobs array
            $jobPosition = $jobs.IndexOf($rule)
            #Check if any hashkey value is in the jobs array
            foreach($value in $rules[$rule]){
                #Only test if the hashkey value is in the jobs array
                if($jobs -contains $value){
                    #Set the position of the hashkey value within the jobs array
                    $valuePosition = $jobs.IndexOf($value)
                    if($jobPosition -ge $valuePosition){
                        #if the hashkey is after the value, it is not a valid order
                        return $false
                    }
                }
            }
        }
    }
    return $true
}

$InputList = Get-content .\input.txt 
#Pull out rules
$Rules = (Select-String -InputObject $InputList -Pattern '\d\d\|\d\d' -AllMatches).Matches.Value | Sort-Object 
#Replace rules to get remaining instructions
$Instructions = $InputList -replace '\d\d\|\d\d', '' | Where-Object {$_.Trim() -ne ''}

#Put rules into a hashmap
$rulesHash = @{}
foreach($rule in $Rules){
    $a,$b = $rule -split '\|'
    $rulesHash[$a] += @($b)
}

$rules = $rulesHash

$sum = 0

foreach ($instruction in $Instructions){
    
    $jobs = $instruction -split ','
    #Test each instruction set
    if(Test-RuleOrder -Rules $rules -Instructions $jobs){
        #If it is a valid ($true) set, find the middle and add it to the $sum
        $middle = [System.Math]::Floor(($jobs.Count - 1) / 2)
        $middlejob = $jobs[$middle]
        $sum += [int]$middlejob
    }
}
Write-host "The total is: $sum"