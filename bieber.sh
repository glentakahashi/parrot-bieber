#!/bin/bash

function abs_path {
  echo $(cd $(dirname "$1") && pwd -P)/$(basename "$1")
}

mkdir -p ~/.tmp
cd ~/.tmp
wget --no-check-certificate https://github.com/jmhobbs/terminal-parrot/releases/download/1.0.1/terminal-parrot-darwin-amd64.zip
unzip -f terminal-parrot-darwin-amd64.zip

case $SHELL in
  */zsh)
    echo 'export PATH=$PATH:'$(abs_path ~/.tmp) >> ~/.zshrc
    echo "alias ls='([[ \$RANDOM -lt 8192 ]] && terminal-parrot -loops 3); ls'" >> ~/.zshrc
    clear
    ;;
  */bash)
    echo 'export PATH=$PATH:'$(abs_path ~/.tmp) >> ~/.bashrc
    echo "alias ls='([[ \$RANDOM -lt 8192 ]] && terminal-parrot -loops 3); ls'" >> ~/.bashrc
    clear
    ;;
  *)
    # assume something else
esac
