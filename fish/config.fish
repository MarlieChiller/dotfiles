if status is-interactive
    # Commands to run in interactive sessions can go here
end
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(pyenv init -)"
zoxide init fish | source