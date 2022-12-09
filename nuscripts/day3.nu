def day3a [ filename: path ] {
  open $filename | lines | each {|it| find_common_item $it | find_priority } | math sum
}

def day3b [ filename: path ] {
  open $filename | lines | window 3 --stride 3 | each {|it| find_badge $it | find_priority } | math sum
}

def find_common_item [ rucksack_items: string ] {
  let half = (($rucksack_items | str length) / 2)
  let compartments = [($rucksack_items | str substring 0..$half), ($rucksack_items | str substring $half..)]
  $compartments.0 | split chars | where {|it| $it in $compartments.1} | get 0
}

def find_priority [ ] {
  let input = $in
  ('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ' | str index-of $input) + 1 
}

def find_badge [ elf_group: list ] {
  $elf_group.0 | split chars | where {|it| $it in $elf_group.1 && $it in $elf_group.2} | get 0
}
