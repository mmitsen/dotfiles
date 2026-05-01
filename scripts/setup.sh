#! /bin/bash


if [ -n "$BASH_SOURCE" ]; then
    # We are in Bash
    RELATIVE_PATH="${BASH_SOURCE[0]}"
elif [ -n "$ZSH_VERSION" ]; then
    # We are in Zsh
    RELATIVE_PATH="$0"
else
    # Fallback for other shells
    RELATIVE_PATH="$0"
fi

# 2. Resolve the absolute directory
SCRIPT_DIR=$(cd -- "$(dirname -- "$RELATIVE_PATH")" &> /dev/null && pwd)


ln -sf $SCRIPT_DIR/../bash/.bashrc    ~/.bashrc-${USER}
ln -sf $SCRIPT_DIR/../zsh/.zshrc      ~/.zshrc-${USER}
ln -sf $SCRIPT_DIR/../tmux/.tmux.conf ~/.tmux.conf
ln -sf $SCRIPT_DIR/../vim/.vimrc ~/.vimrc
ln -sf $SCRIPT_DIR/../git/.gitconfig  ~/.gitconfig
ln -sf $SCRIPT_DIR/../inputrc/.inputrc  ~/.inputrc
# Install zsh-history-substring-search
