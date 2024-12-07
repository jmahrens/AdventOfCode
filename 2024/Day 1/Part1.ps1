$Content = Get-Content $PSScriptRoot\Input.txt
   
$data1 = $Content | Sort-Object | ForEach-Object { ($_.split(' ',[System.StringSplitOptions]::RemoveEmptyEntries))[0] }
#Sort after the split to correctly sort the second column
$data2 = $Content | ForEach-Object {($_ -split '\s{3,}')[1]} | Sort-Object
    
$difference = for ($i=0;$i -lt $data1.Count;$i++){
    #Use absolute value to find the difference between the variables instead of figuring out which is item in the array is larger
    [math]::Abs(($data2[$i] - $data1[$i]))
}
$answer = ($difference | Measure-Object -sum).Sum
Write-Host $answer