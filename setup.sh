xcode-select --install

echo "installing homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew update
brew upgrade

formulas=(
  git
  wget
  curl
  cmake
  tree
  cask
  ansible
  nfk
  neovim
  zlib
  reattach-to-user-namespace
  tmux
  python-configparser
  fzf
  hub
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

echo "start link dotfiles..."

DOT_FILES=(.zshrc .tmux.conf .config/nvim/ .config/karabiner/karabiner.json)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

echo "finish.."
