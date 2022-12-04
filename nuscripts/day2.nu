def day2a [ filename: path ] {
  let games = (open $filename | lines | split column ' ') 
  # 1 = rock, 2 = paper, 3 = scissors
  let decode = {'A': 1, 'X': 1, 'B': 2,  'Y': 2, 'C': 3, 'Z': 3}
  let decoded_game = ($games | update column1 {|it| $decode | get $it.column1 } | update column2 {|it| $decode | get $it.column2})
  let shape_points = ($decoded_game | get column2 | math sum)
  let game_points = ($decoded_game | each {|it| play_game $it.column1 $it.column2} | math sum)
  $shape_points + $game_points
}

def play_game [ them: int you: int] {
  if $them == $you {
    3
  } else if $you  == $them mod 3 + 1 {
    6
  } else {
    0
  }
}

def decode_b [ them: int you: string ] {
  if $you == 'X' {
    if $them == 1 { 3 } else if $them == 2 { 1 } else { 2 }
  } else if $you == 'Y' {
    $them
  } else if $you == 'Z' {
    $them mod 3 + 1
  }
}

def day2b [ filename: path ] {
  let games = (open $filename | lines | split column ' ') 
  # 1 = rock, 2 = paper, 3 = scissors
  let decode = {'A': 1, 'X': 1, 'B': 2,  'Y': 2, 'C': 3, 'Z': 3}
  let decoded_game = ($games | update column1 {|it| $decode | get $it.column1 } | update column2 {|it| decode_b $it.column1 $it.column2})
  let shape_points = ($decoded_game | get column2 | math sum)
  let game_points = ($decoded_game | each {|it| play_game $it.column1 $it.column2} | math sum)
  $shape_points + $game_points
}
