# Places to look for executables

function _look_for_executables_in {
  # Only adds the path to $PATH if it exists
  test -d $1 && export PATH="$1:$PATH"
}

# Prepend /usr/local/bin so that homebrew-installed executables override default OS ones
_look_for_executables_in "/usr/local/bin"

# Global NPM Executables
_look_for_executables_in "/usr/local/share/npm/bin" &&
  # Executables from the node modules in the current directory
  export PATH="./node_modules/.bin:$PATH"

# Clojure Executables
_look_for_executables_in "$HOME/.cljr/bin"

# Ruby Executables (via rbenv) Executables
_look_for_executables_in "$HOME/.rbenv/bin" &&
  eval "$(rbenv init -)" # And then run the init script

# Python Executables (via with homebrew)
_look_for_executables_in "/usr/local/share/python"

# Heroku Toolbelt
_look_for_executables_in "/usr/local/heroku/bin"

# Custom Executables
_look_for_executables_in "$HOME/bin"

# ---

# A custom fancy prompt
test -f  "$HOME/.ps1" &&
  source "$HOME/.ps1"

# ---

# Set sublime to the default editor and alias it to `e` if it is present
subl=`which subl`
test $subl &&
  export EDITOR="'$subl' --wait" &&
  alias e=subl

# ---

# For rubby development
which -s bundle && alias be="bundle exec"

# ---

# Annotate file types : -F
# Colors              : -G
# Human file sizes    : -h
alias ls='ls -FGh'
