require 'rake'

desc "Install dotfiles"
task :install do
  puts "NOTICE: Before you start, make sure you connect to the VPN ;-)"
  print "Ready? [ynq]"
  case $stdin.gets.chomp
  when 'y'
    install_homebrew
    install_homebrew_packages
    install_basic_mac_apps
    install_oh_my_zsh
    install_zsh_syntax_highlighting
    switch_to_zsh
  when 'q'
    exit
  else
    puts "Installation failed!"
  end
end

def install_homebrew
  system %Q{which brew}
  unless $?.success?
    system %Q{ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"}
  else
    puts "You already installed Homebrew"
  end
end

def install_homebrew_packages
  print "install homebrew packages? [ynq]"
  case $stdin.gets.chomp
  when 'y'
    puts "installing homebrew packages"
    system %Q{brew install autojump git mysql node imagemagick git-extras}
    system %Q{brew install caskroom/cask/brew-cask}
  when 'q'
    exit
  else
    puts "skipping install homebrew packages"
  end
  puts "running 'brew linkapps'"
  system %Q{brew linkapps}
  puts "running 'brew update'"
  system %Q{brew update}
  puts "running 'brew doctor'"
  system %Q{brew doctor}
  puts "running 'brew upgrade'"
  system %Q{brew upgrade}
  puts "running 'brew cleanup'"
  system %Q{brew cleanup}
  puts "finish install homebrew packages"
end

def install_oh_my_zsh
  if File.exist?(File.join(ENV['HOME'], ".oh-my-zsh"))
    puts "found ~/.oh-my-zsh"
  else
    print "install oh-my-zsh? [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "installing oh-my-zsh"
      system %Q{git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"}
    when 'q'
      exit
    else
      puts "skipping oh-my-zsh, you will need to change ~/.zshrc"
    end
  end
end

def install_zsh_syntax_highlighting
  if File.exist?(File.join(ENV['HOME'], ".oh-my-zsh/custom/plugins/zsh-syntax-highlighting"))
    puts "found ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
  else
    print "install zsh-syntax-highlighting? [ynq]"
    case $stdin.gets.chomp
    when 'y'
      puts "install zsh-syntax-highlighting"
      system %Q{git clone git://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"}
    when 'q'
      exit
    else
      puts "skipping zsh-syntax-highlighting, you will need to change ~/.oh-my-zsh/custom/plugins"
    end
  end
end

def switch_to_zsh
  if ENV["SHELL"] =~ /zsh/
    puts "You are using zsh!"
  else
    print "switch to zsh? (highly recommended) [ynq]"
    case $stdin.gets.chomp
    when 'y'
      puts "switching to zsh"
      system %Q{chsh -s `which zsh`}
    when 'q'
      exit
    else
      puts "skipping zsh"
    end
  end
end

def install_basic_mac_apps
  puts "installing some awesome mac apps"
  system %Q{brew cask install sublime-text iterm2 sequel-pro alfred spectacle gitx-rowanj google-chrome dash}
end
