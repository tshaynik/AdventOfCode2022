def day1a [ filename: path ] {
  open $filename | split row "\n\n" | each {|it| $it | lines | each {|ot| $ot | into int } | math sum } | math max 
}


def day1b [ filename: path ] {
  open $filename | split row "\n\n" | each {|it| $it | lines | each {|ot| $ot | into int } | math sum } | sort -r | first 3 | math sum
}
