#!/bin/bash

set -e

echo "🧰 Installing Zsh and developer-friendly config..."

# Install Zsh and dependencies
sudo apt update
sudo apt install -y zsh git curl fonts-powerline

# Set Zsh as default shell
chsh -s $(which zsh)

# Define home and Zsh paths
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "📦 Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install Plugins
echo "🔌 Installing plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-history-substring-search "$ZSH_CUSTOM/plugins/zsh-history-substring-search"
git clone https://github.com/olivierverdier/zsh-git-prompt "$ZSH_CUSTOM/plugins/zsh-git-prompt"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"

# Write Zsh config
echo "📝 Writing ~/.zshrc..."
cat << 'EOF' > ~/.zshrc
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-history-substring-search
  zsh-git-prompt
)

source $ZSH/oh-my-zsh.sh

# Plugin configs
source $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/custom/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source $ZSH/custom/plugins/zsh-git-prompt/zshrc.sh

# Disable new user prompt
zstyle ':zsh-newuser-install:*' disable true

# Powerlevel10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
EOF

# Create required zsh files to suppress prompt
touch ~/.zshenv ~/.zprofile ~/.zlogin ~/.zcompdump

echo "✅ Zsh environment ready! Start a new terminal or run: zsh"

