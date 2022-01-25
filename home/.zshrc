# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/davidderen/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=cobalt2

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
plugins=(
  git
  z
  deno
  dotenv
  mix
  node
  nvm
  npm
  docker
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
# aliases

#WPA Testing

# launch chrome canary in unsafe mode (allows keeping regular chrome open)
alias unsafe-canary="nohup /Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --new-window --disable-web-security --user-data-dir=/Users⁩/david.derenshowpad.com⁩/Library⁩/⁨Application\ Support⁩/⁨Google⁩ --ignore-certificate-errors"
# launch chrome in unsafe mode (allows keeping regular chrome open)
alias unsafe-chrome="nohup /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --new-window --disable-web-security --user-data-dir=/Users⁩/david.derenshowpad.com⁩/Library⁩/⁨Application\ Support⁩/⁨Google⁩ --ignore-certificate-errors"
# start web-app on localhost:4200
alias start4200="npm start --  web-app"
# start windows-desktop-app on localhost:4300
alias start4300="ng serve --ssl --port 4300 windows-desktop-app"
# start both web-app and windows-desktop-app and launch chrome canary in unsafe mode
alias wda-canary="start4200 & start4300 & unsafe-canary"
# stop web-app on localhost:4200
alias stop4200="lsof -i tcp:4200 | grep LISTEN | awk '{print $2}'"
# | grep LISTEN | awk '{print $2}' | xargs kill -9"
# stop windows-desktop-app on localhost:4300
alias stop4300="lsof -i tcp:4300 | grep LISTEN | awk '{print $2}' | xargs kill -9"
# stop both web-app and windows-desktop-app
alias wda-stop="stop4200 & stop4300"

# start setup for testing inside VM
# alias vm-setup="ng serve web-app --ssl --host=0.0.0.0 --port 4200 --extra-webpack-config ../../webpack.extra.js & ng serve windows-desktop-app --ssl --host=0.0.0.0 --port 4300 --extra-webpack-config ../../webpack.extra.js"
alias my-vm-setup="ng serve web-app --ssl --ssl-cert ssl/server.crt --ssl-key ssl/server.key --host=0.0.0.0 --disableHostCheck true --port 4200 & ng serve windows-desktop-app --ssl --ssl-cert ssl/server.crt --ssl-key ssl/server.key --ssl --host=0.0.0.0 --disableHostCheck true --port 4300"
alias vm-build="ng build --prod --project web-app && npm run workbox:web-app & ng build --prod --project windows-desktop-app"

alias start:sw-web-app="http-server /Users/david.derenshowpad.com/Projects/frontend/dist/apps/web-app --proxy https://test-davidd.staging.showpad.com -p 4200"
alias start:sw-wda="http-server /Users/david.derenshowpad.com/Projects/frontend/dist/apps/windows-desktop-app -p 4300"


# Mine
alias copy-ip="ipconfig getifaddr en0 | pbcopy"

alias eslint-staged="~/shell-scripts/eslint-staged.sh"

# Docker
# alias dnuke="docker stop $(docker ps -qa) && docker system prune -af --volumes"
alias dnuke="docker ps -qa | xargs -t docker stop && docker system prune -af --volumes"

## Containers
alias dcl="docker container ls -a"
alias dcr="docker container rm"
alias dcra="docker ps -a -q -f status=exited | xargs docker rm" # Removes all stopped containers

## Images
alias dil="docker image ls"
alias dir="docker image rm"
alias dira="docker images -a -q | xargs docker rmi -f"

## Compose
alias dcdev="docker-compose -f docker-compose.dev.yml up"
alias dcdev-build="docker-compose -f docker-compose.dev.yml up --build"

## Misc
alias plugins-daily='open "https://jira.showpad.io/secure/Dashboard.jspa?selectPageId=19500" && open "https://jira.showpad.io/secure/RapidBoard.jspa?rapidView=560" && open "https://pickerwheel.com/pw?id=mxvjK"'

# Key Bindings
bindkey -s ^f "tmux-sessionizer\n"




# [ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
# export AWS_PROFILE=content_integr-008013142040
# export AWS_SDK_LOAD_CONFIG=1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc