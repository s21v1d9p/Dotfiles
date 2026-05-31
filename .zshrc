# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
typeset -U path PATH
export PATH="/opt/homebrew/bin:$PATH"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

ZSH_THEME="minimal"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt NO_BEEP
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt SHARE_HISTORY

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.zcompcache"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export JAVA_HOME=$(/usr/libexec/java_home -v 21.0.7)
export PATH=$JAVA_HOME/bin:$PATH
export HOMEBREW_NO_AUTO_UPDATE=1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

load_keychain_secret() {
  local env_name="$1"
  local service_name="shell/$env_name"
  local secret

  secret="$(security find-generic-password -a "$USER" -s "$service_name" -w 2>/dev/null)" || return 0
  export "$env_name=$secret"
}

load_keychain_secret GEMINI_API_KEY
load_keychain_secret OPENAI_API_KEY
load_keychain_secret GOOGLE_GENERATIVE_AI_API_KEY
load_keychain_secret GOOGLE_API_KEY

alias vim="nvim"
alias v="vim"
alias nv="nvim"
alias ll='ls -lah'
alias la='ls -A'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias gs='git status -sb'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias reload='source ~/.zshrc'
alias zshconfig='${EDITOR:-nvim} ~/.zshrc'
alias pathdump='print -l $path'
alias ff='fd'

mkcd() {
  mkdir -p -- "$1" && cd -- "$1"
}

if command -v eza >/dev/null 2>&1; then
  alias le='eza -lah --group-directories-first --git'
  alias lt='eza --tree --level=2 --group-directories-first'
  alias l1='eza -1 --group-directories-first'
fi

if command -v bat >/dev/null 2>&1; then
  alias catp='bat --paging=never --style=plain'
  alias preview='bat --style=numbers --color=always --paging=never'
fi

if command -v fzf >/dev/null 2>&1; then
  if [ -f /opt/homebrew/opt/fzf/shell/completion.zsh ]; then
    source /opt/homebrew/opt/fzf/shell/completion.zsh
  fi

  if [ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]; then
    source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
  fi

  if command -v fd >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND='fd --type d --strip-cwd-prefix'
  fi

  if command -v bat >/dev/null 2>&1; then
    export FZF_CTRL_T_OPTS='--preview "bat --style=numbers --color=always --line-range :500 {}"'
  fi

  cdf() {
    local dir
    if command -v fd >/dev/null 2>&1; then
      dir="$(fd --type d --strip-cwd-prefix . | fzf)" || return 1
    else
      dir="$(find . -type d 2>/dev/null | fzf)" || return 1
    fi
    cd -- "$dir"
  }
fi

# Added by LM Studio CLI (lms)
export PATH="$PATH:$HOME/.lmstudio/bin"
# End of LM Studio CLI section

# Added by Antigravity
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

# Created by `pipx` on 2025-11-30 11:16:31
export PATH="$PATH:$HOME/.local/bin"

# Antigravity IDE with GPU

# opencode
export PATH=$HOME/.opencode/bin:$PATH

# claude

alias copiloted="copilot --yolo"
alias clauded="claude --dangerously-skip-permissions"

# Codex
alias codexed='codex -a on-request -s workspace-write'

#Antigravity-cli
alias agyed='agy --dangerously-skip-permissions'

# ollama

alias gemma="ollama launch claude --model gemma4:e2b"

#Openrouter
#export OPENAI_BASE_URL="https://openrouter.ai/api/v1"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

alias claude-mem='$HOME/.bun/bin/bun "$HOME/.claude/plugins/marketplaces/thedotmack/plugin/scripts/worker-service.cjs"'


# Added by Antigravity CLI installer
export PATH="$HOME/.local/bin:$PATH"

# ==============================================================================
# macOS & Power AI Developer Enhancements
# ==============================================================================

# macOS Integrations (copy, paste, f, finder, ports)
alias copy="pbcopy"
alias paste="pbpaste"
alias f="open ."
alias finder="open -a Finder"
alias ports='lsof -iTCP -sTCP:LISTEN -P'

# Apple Script Notifications for long operations. Usage: sleep 5; notify
notify() {
  local title="${1:-Command Finished}"
  local msg="${2:-Your background terminal command has finished running.}"
  osascript -e "display notification \"$msg\" with title \"$title\" sound name \"Glass\""
}

# Unified Homebrew Maintenance
alias brewup="brew update && brew upgrade && brew cleanup"

# AI API Key & Keychain helper function & extra loaders
set_keychain_secret() {
  local env_name="$1"
  if [[ -z "$env_name" ]]; then
    echo "Usage: set_keychain_secret VARIABLE_NAME"
    return 1
  fi
  local service_name="shell/$env_name"
  local secret
  read -s "secret?Enter value for $env_name: "
  echo ""
  
  if [[ -n "$secret" ]]; then
    security add-generic-password -a "$USER" -s "$service_name" -w "$secret" -U
    export "$env_name=$secret"
    echo "✅ Secret $env_name successfully saved to macOS Keychain and exported."
  else
    echo "❌ Secret entry cancelled."
  fi
}

load_keychain_secret ANTHROPIC_API_KEY
load_keychain_secret DEEPSEEK_API_KEY
load_keychain_secret GROQ_API_KEY
load_keychain_secret TAVILY_API_KEY
load_keychain_secret EXA_API_KEY
load_keychain_secret PERPLEXITY_API_KEY
load_keychain_secret OPENROUTER_API_KEY
load_keychain_secret HUGGINGFACE_CO_API_TOKEN
load_keychain_secret COHERE_API_KEY
load_keychain_secret MISTRAL_API_KEY

# PyTorch Metal Performance Shaders (MPS) fallback configuration
export PYTORCH_ENABLE_MPS_FALLBACK=1

# Auto-activate/deactivate Python virtualenv on directory change
python_venv_auto_activate() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    if [[ "$PWD" != "${VIRTUAL_ENV:h}"* ]]; then
      deactivate
    fi
  fi
  
  if [[ -z "$VIRTUAL_ENV" ]]; then
    if [[ -d ".venv" && -f ".venv/bin/activate" ]]; then
      source .venv/bin/activate
    elif [[ -d "venv" && -f "venv/bin/activate" ]]; then
      source venv/bin/activate
    fi
  fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd python_venv_auto_activate
python_venv_auto_activate

# Astral uv aliases
if command -v uv >/dev/null 2>&1; then
  alias uvp="uv pip"
  alias uvr="uv run"
  alias uvx="uvx"
  alias uvvenv="uv venv"
fi

alias ve="source .venv/bin/activate || source venv/bin/activate"

# Hugging Face Cache & Model Management
alias hf-cache='du -sh ~/.cache/huggingface/hub/* 2>/dev/null || echo "No Hugging Face models cached."'
alias hf-clean='huggingface-cli delete-cache'
alias oll='ollama list'
alias olps='ollama ps'

# Apple Silicon GPU/Memory Monitoring (needs sudo)
alias mpsmon="sudo powermetrics --samplers gpu_power"

# Claude Desktop & MCP Development Utilities
alias claudecfg="${EDITOR:-nvim} ~/Library/Application\ Support/Claude/claude_desktop_config.json"
alias claudelogs="tail -n 100 -f ~/Library/Logs/Claude/mcp.log"

