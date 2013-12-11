function _join {
  local s=''
  for arg in $@
    do s+=$arg
  done
  echo -n $s
}

with_working_dir=(
  # dark gray
  '\[' '\e' '[0;38;5;246m' '\]'
  # working dir
  '\W'
  # reset color
  '\['  '\e' '[m' '\]'
  # light gray
  '\[' '\e' '[0;38;5;252m' '\]'
  # space and dollar sign
  '\040' '$'
  # reset color
  '\[' '\e' '[m' '\]'
  # space
  '\040'
)
with_working_dir=`_join ${with_working_dir[@]}`

without_working_dir=(
  # light gray
  '\[' '\e' '[0;38;5;252m' '\]'
  # just dollar sign
  '$'
  # reset color
  '\[' '\e' '[m' '\]'
  # space
  '\040'
)
without_working_dir=$(_join ${without_working_dir[@]})

export PS1=$with_working_dir

# Toggles between a useful prompt and on that's nice for copying lines for instructional material
function ps1 {
  if [ $PS1 = $with_working_dir ];
    then export PS1=$without_working_dir
    else export PS1=$with_working_dir
  fi
}
