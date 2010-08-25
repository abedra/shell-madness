function zsh_recompile() {
  autoload -U zrecompile
  [[ -f ~/.zshrc ]] && zrecompile -p ~/.zshrc
  [[ -f ~/.zshrc.zwc.old ]] && rm -f ~/.zshrc.zwc.old

  for f in ~/.zsh/**/*.zsh; do
    [[ -f $f ]] && zrecompile -p $f
    [[ -f $f.zwc.old ]] && rm -f $f.zwc.old
  done

  [[ -f ~/.zcompdump ]] && zrecompile -p ~/.zcompdump
  [[ -f ~/.zcompdump.zwc.old ]] && rm -f ~/.zcompdump.zwc.old

  source ~/.zshrc
}

function update_textmate_bundles {
  for dir in ~/Library/Application\ Support/TextMate/Bundles/*.tmbundle; do
    cd $dir
    git pull
    svn up
    cd -
  done
}

function mysqlredo {
  mysqladmin drop $1
  mysqladmin create $1
}

function crypted_truths {
  /Applications/TrueCrypt.app/Contents/MacOS/TrueCrypt -t -k "" --protect-hidden=no ~/Documents/work ~/src/relevance
  /Applications/TrueCrypt.app/Contents/MacOS/TrueCrypt -t -k "" --protect-hidden=no ~/src/relevance/relevance_it/passwords2.tc
}

function vzb-ssh {
  ssh -i ~/.ssh/vzb.ec2.pem root@$1
}

function ss {
  if [ -e script/rails ]; then
    script/rails server $@
  else
    script/server $@
  fi
}

function sc {
  if [ -e script/rails ]; then
    script/rails console $@
  else
    script/console $@
  fi
}

function sg {
  if [ -e script/rails ]; then
    script/rails generate $@
  else
    script/generate $@
  fi
}
