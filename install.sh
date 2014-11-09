if [ ! -d "$HOME/.dotfiles" ]; then
  echo "Installing Beansmile dotfiles for the first time!"
  git clone git@github.com:chankaward/beansmile-dotfiles.git "$HOME/.dotfiles"
  cd "$HOME/.dotfiles"
  rake install
else
  echo "You already have dotfiles"
fi
