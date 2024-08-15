#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
#if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
#fi

export XDG_CONFIG_HOME=~/.config

export EDITOR='nvim'

export PATH="$PATH:$HOME/emsdk"
export PATH="$PATH:$HOME/emsdk/clang/fastcomp/build_incoming_64/bin"
#export PATH="$PATH:$HOME/emsdk/node/12.9.1_64bit/bin"
export PATH="$PATH:$HOME/emsdk/emscripten/incoming"
export PATH="$PATH:$HOME/emsdk/binaryen/master_64bit_binaryen/bin"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

if [ $SHLVL = 1 ]; then
  alias tmuxx="tmux -2 attach || tmux -2 new-session \; source-file ~/dotfiles/tmux/new-session"
fi

function urlencode {
  perl -MURI::Escape -e "print uri_escape('$*')"
}

alias dds="find ./ -name .DS_Store -print -exec rm {} ';'"
# clang
#export PATH="/usr/local/opt/opencv@2/bin:$PATH"
#export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/opencv@3/lib/pkgconfig"
#export C_INCLUDE_PATH="/usr/local/Cellar/glfw/3.2.1/include/GLFW" #任意のディレクトリ(1)
#
#export LDFLAGS="$LDFLAGS:-L/usr/local/opt/openblas/lib"
#export CPPFLAGS="$CPPFLAGS:-I/usr/local/opt/openblas/include"
#export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/openblas/lib/pkgconfig"
#
#export LDFLAGS="$LDFLAGS:-L/usr/local/opt/readline/lib"
#export CPPFLAGS="$CPPFLAGS:-I/usr/local/opt/readline/include"
#export PKG_CONFIG_PATH="$PKG_CONFIG_PATH/usr/local/opt/readline/lib/pkgconfig"
#
#export LDFLAGS="$LDFLAGS:-L/usr/local/opt/opencv@2/lib"
#export CPPFLAGS="$CPPFLAGS:-I/usr/local/opt/opencv@2/include"
#export PKG_CONFIG_PATH="$PKG_CONFIG_PATH/usr/local/opt/opencv@2/lib/pkgconfig"
#
#export CPATH="$CPATH:/usr/local/include"
#export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"
#brew tap homebrew/science
#brew update
#brew install opencv3 --with-contrib --with-ffmpeg --with-opengl --with-python3
#
#オプションに関しては https://www.learnopencv.com/install-opencv-3-on-yosemite-osx-10-10-x/ を参照
#
#このままでは，pkg-configを使えないことから，下記の様にpkg-config用の設定ファイルをコピーする．
#
#cd /usr/local/Cellar/opencv/4.1.1_1/lib/pkgconfig
#sudo cp opencv.pc /usr/local/lib/pkgconfig/opencv.pc
#
#そして，このままではlibippicv.aにパスが通っていないことから，下記を実行しシンボリックリンクを貼る．
#
#cd /usr/local/Cellar/opencv3/3.1.0_4/lib
#ln -s /usr/local/Cellar/opencv3/3.1.0_4/share/OpenCV/3rdparty/lib/libippicv.a libippicv.a
export PATH="/usr/local/opt/tmux@2.9a/bin:$PATH"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk


# zinit
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zdharma/history-search-multi-word

# alias

. /opt/homebrew/opt/asdf/libexec/asdf.sh
