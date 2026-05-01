# Kubernetes alias
alias k='kubectl'
alias c='clear'
alias v='vi'
alias gl='git log'
alias gitdif='f() { git difftool -y --extcmd "cursor --wait --diff" "$@"; }; f'
alias gpr="git pull --rebase"
alias ll="ls -ltrh"
export TELEPORT_ADD_KEYS_TO_AGENT=no

mkcd() {
  mkdir -p "$1" && cd "$1"
}
if [ -n "$TMUX" ]; then
  # Pull the latest VS Code IPC hook from the tmux manager
  export VSCODE_IPC_HOOK_CLI=$(tmux show-env | grep ^VSCODE_IPC_HOOK_CLI | cut -d= -f2)
fi
