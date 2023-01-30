if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias du="dust"
alias df="duf"
alias ps="procs"
alias top="btm"
alias ls="exa -F"
alias la="exa -laF"
alias ll="exa -llF --icons"
alias l="exa -F"
alias cat="bat --paging=never"
alias vim="nvim"
alias find="fd"
alias ip='ip -color=auto'

starship init fish | source
