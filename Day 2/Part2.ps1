#Rock Paper Scissors

$Games = Get-Content 'F:\AdventOfCode\Day 2\Day2Input.txt'
$Score = 0

foreach ($Round in $Games){
    $Player1 = $Round.Split()[0]
    $Player2 = $Round.Split()[1]

    switch ($Player1)    {
        "A" {
            switch($Player2){ #Player 1 Rock
                "X" {$Score += 3 + 0} #Player 2 Lose / Scissor
                "Y" {$Score += 1 + 3} #Player 2 Draw / Rock
                "Z" {$Score += 2 + 6} #Player 2 Win / Paper
            }
        }
        "B"{
            switch($Player2){ #Player 1 Paper
                "X" {$Score += 1 + 0} #Player 2 Lose / Rock
                "Y" {$Score += 2 + 3} #Player 2 Draw / Paper
                "Z" {$Score += 3 + 6} #Player 2 Win/ Scissor
            }
        }
        "C"{
            switch($Player2){ #Player 1 Scissor
                "X" {$Score += 2 + 0} #Player 2 Lose / Paper
                "Y" {$Score += 3 + 3} #Player 2 Draw / Scissor
                "Z" {$Score += 1 + 6} #Player 2 Win / Rock
            }
        }
    }
}

Write-host $Score