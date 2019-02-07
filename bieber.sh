#!/bin/bash

function abs_path {
  echo $(cd $(dirname "$1") && pwd -P)/$(basename "$1")
}

mkdir -p ~/.tmp
curl -k -L https://github.com/jmhobbs/terminal-parrot/releases/download/1.1.1/terminal-parrot-darwin-amd64.zip -o ~/.tmp/terminal-parrot.zip
unzip ~/.tmp/terminal-parrot.zip -d ~/.tmp

ALIAS="alias ls='if [[ \$((\$RANDOM % 64)) -eq 0 ]]; then terminal-parrot -loops 3; fi; ls'"

case $SHELL in
  */zsh)
    echo 'export PATH=$PATH:'$(abs_path ~/.tmp) >> ~/.zshrc
    echo $ALIAS >> ~/.zshrc
    clear
    ;;
  */bash)
    echo 'export PATH=$PATH:'$(abs_path ~/.tmp) >> ~/.bashrc
    echo $ALIAS >> ~/.bashrc
    clear
    ;;
  *)
    # assume something else
esac
