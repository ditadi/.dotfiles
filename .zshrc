export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

export PATH=/Users/victorditadi/.local/bin:/opt/homebrew/opt/ruby/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Users/victorditadi/.cargo/bin
export PATH=$PATH:$(npm config --global get prefix)/bin

alias n="nvim ."
alias ls="lsd -l -a"
alias v="fd --type d --hidden --exclude .git/ | fzf-tmux | xargs nvim"
alias c="cd ~/Desktop/apps/" 
alias f="tmux-sessionizer"
alias s="cht"

if [ -f '/Users/victorditadi/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/victorditadi/Downloads/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/victorditadi/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/victorditadi/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

[ -s "/Users/victorditadi/.bun/_bun" ] && source "/Users/victorditadi/.bun/_bun"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

source /Users/victorditadi/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# pnpm
export PNPM_HOME="/Users/victorditadi/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export BUN_INSTALL="/Users/victorditadi/.bun" 
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="/usr/local/go/bin:$PATH"
export PATH=$HOME/go/bin:$PATH
