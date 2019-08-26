xcode-select --install

echo "installing homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew update
brew upgrade

formulas=(
  git
  zsh
  zsh-completions
  wget
  curl
  cmake
  tree
  cask
  ansible
  nfk
  neovim
  fontforge
  zlib
  reattach-to-user-namespace
  tmux
  python-configparser
  fzf
  zsh
  hub
  fontforge
  boost
  pyenv
  nodenv
  zlib
)

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

casks=(
  firefox
  google-chrome
  google-japanese-ime
  slack
  source-tree
  vs-code
  iterm2
  karabiner-elements
  vagrant
  vagrant-manager
)

echo "start brew cask install apps..."
for cask in "${casks[@]}"; do
    brew cask install $cask
done

brew cleanup
brew cask cleanup

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s /usr/local/bin/zsh

echo "start link dotfiles..."

DOT_FILES=(.zshrc .tmux.conf .config/nvim/ .config/karabiner/karabiner.json)

mkdir ~/.config/
mkdir ~/.config/karabiner


for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

chsh -s /usr/local/bin/zsh
pip3 install neovim
nodenv install 10.16.0

defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder

echo "finish.."
