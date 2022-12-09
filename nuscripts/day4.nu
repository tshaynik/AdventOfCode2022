def day4a [ filename: path ] {
  open $filename
  | lines
  | parse "{start1}-{end1},{start2}-{end2}"
  | each {|it| $it | to_ints | fully_contained }
  | where $it == true
  | length
}

def day4b [ filename: path ] {
  open $filename
  | lines
  | parse "{start1}-{end1},{start2}-{end2}"
  | each {|it| $it | to_ints | overlap }
  | where $it == true
  | length
}

def to_ints [ ] {
  let input = $in
  {
    s1: ($input.start1 | into int)
    e1: ($input.end1 | into int)
    s2: ($input.start2 | into int)
    e2: ($input.end2 | into int)
  }
}

def fully_contained [ ] {
  let x = $in
  ($x.s1 <= $x.s2 && $x.e1 >= $x.e2) || ($x.s1 >= $x.s2 && $x.e1 <= $x.e2)
}

def overlap [ ] {
  let x = $in
  ($x | fully_contained ) || ($x.s1 >= $x.s2 && $x.s1 <= $x.e2) || ($x.e1 >= $x.s2 && $x.e1 <= $x.e2)  
}