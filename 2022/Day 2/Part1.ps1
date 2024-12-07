#Rock Paper Scissors

$Games = Get-Content 'F:\AdventOfCode\Day 2\Day2Input.txt'
$Score = 0

foreach ($Round in $Games){
    $Player1 = $Round.Split()[0]
    $Player2 = $Round.Split()[1]

    switch ($Player1)    {
        "A" {
            switch($Player2){ #Player 1 Rock
                "X" {$Score += 1 + 3} #Player 2 Rock / Tie
                "Y" {$Score += 2 + 6} #Player 2 Paper / Win
                "Z" {$Score += 3 + 0} #Player 2 Scissor / Lose
            }
        }
        "B"{
            switch($Player2){ #Player 1 Paper
                "X" {$Score += 1 + 0} #Player 2 Rock / Lose
                "Y" {$Score += 2 + 3} #Player 2 Paper / Tie
                "Z" {$Score += 3 + 6} #Player 2 Scissor / Win
            }
        }
        "C"{
            switch($Player2){ #Player 1 Scissor
                "X" {$Score += 1 + 6} #Player 2 Rock / Win
                "Y" {$Score += 2 + 0} #Player 2 Paper / Lose
                "Z" {$Score += 3 + 3} #Player 2 Scissor / Tie
            }
        }
    }
}

Write-host $Score