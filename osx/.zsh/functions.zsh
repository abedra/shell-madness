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

function crypted_truths {
    /Applications/TrueCrypt.app/Contents/MacOS/TrueCrypt -t -k "" --protect-hidden=no ~/Documents/work ~/src/relevance
    /Applications/TrueCrypt.app/Contents/MacOS/TrueCrypt -t -k "" --protect-hidden=no ~/src/relevance/relevance_it/passwords2.tc
}

function extract {
    echo Extracting $1 ...
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1  ;;
            *.tar.gz)    tar xzf $1  ;;
            *.bz2)       bunzip2 $1  ;;
            *.rar)       rar x $1    ;;
            *.gz)        gunzip $1   ;;
            *.tar)       tar xf $1   ;;
            *.tbz2)      tar xjf $1  ;;
            *.tgz)       tar xzf $1  ;;
            *.zip)       unzip $1   ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1  ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
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

function shutup_fan {
    /Applications/smcFanControl.app/Contents/Resources/smc -k F1Mx -w 0000
}
