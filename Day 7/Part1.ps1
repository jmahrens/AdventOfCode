$ImportCommands = Get-Content 'F:\AdventOfCode\Day 7\Day7Input.txt'

$CurrentFolder = ""
$Folders = @{}
foreach ($Command in $ImportCommands){
$SplitCommand = $Command -split " "
    If ($SplitCommand[0] -eq '$'){
        switch($Command[1]){
            "cd"{
                switch($Command[2]){
                   '/'{}
                   '..'{
                    $SplitFolders = $CurrentFodler -split "/"
                    $CurrentFolder = ($SplitFolders[0..($SplitFolders.Length - 3)] -join "/") + "/"
                } 
                }
            }
            "ls"{
                do{
                    switch($SubCommand[0]){
                        "dir"{
                        
                        }
                    }
                    default{
                        
                    }
                }
                until($something)
            }
            default {Write-Error "Error"}
        }
    }
}







1
    1.1

    1.2
        1.2.1
        1.2.2
            1.2.2.1
    1.3