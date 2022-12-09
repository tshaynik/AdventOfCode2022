
def day3a [ filename: path ] {
  open $filename | lines | each {|it| find_priority $it} | math sum
}

def find_priority [ rucksack_items: string ] {
  let half = (($rucksack_items | str length) / 2)
  let compartments = [($rucksack_items | str substring 0..$half), ($rucksack_items | str substring $half..)]
  let shared_item = ($compartments.0 | split chars | where {|it| $it in $compartments.1} | get 0)
  ('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ' | str index-of $shared_item) + 1 
}
