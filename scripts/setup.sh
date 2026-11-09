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
DOTFILES_ROOT=$(cd -- "$SCRIPT_DIR/.." && pwd)
ALIASES_GITCONFIG="$DOTFILES_ROOT/git/aliases.gitconfig"


ln -sf $SCRIPT_DIR/../bash/.bashrc    ~/.bashrc-${USER}
ln -sf $SCRIPT_DIR/../zsh/.zshrc      ~/.zshrc-${USER}
ln -sf $SCRIPT_DIR/../tmux/.tmux.conf ~/.tmux.conf
ln -sf $SCRIPT_DIR/../vim/.vimrc ~/.vimrc
ln -sf $SCRIPT_DIR/../inputrc/.inputrc  ~/.inputrc

# Keep ~/.gitconfig as a real file; only manage aliases via include.path.
if [ -L ~/.gitconfig ]; then
    rm ~/.gitconfig
    # Seed once from the local/template settings (no aliases section).
    cp "$DOTFILES_ROOT/git/.gitconfig" ~/.gitconfig
fi
touch ~/.gitconfig

if ! git config --global --get-all include.path 2>/dev/null | grep -Fxq "$ALIASES_GITCONFIG"; then
    git config --global --add include.path "$ALIASES_GITCONFIG"
fi
# Install zsh-history-substring-search
