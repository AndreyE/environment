# .bash_profile

export SHELL=/usr/local/bin/bash

# WARNING: don't put anything outside the if-then-fi scope
if [[ -z $BASH_PROFILE_ALREADY_LOADED_GUARD ]]; then

    export BASH_PROFILE_ALREADY_LOADED_GUARD=1

    # User specific environment and startup programs
    PATH=$PATH:$HOME/bin

    [[ -s "$HOME/.bash_osx_workarounds" ]] && source "$HOME/.bash_osx_workarounds"

    # Load RVM into a shell session *as a function*
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

    # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
    PATH="$PATH:$HOME/.rvm/bin"

    if [ -f ~/.bashrc ]; then
        . ~/.bashrc
    fi

    if [ -f ~/.bashrc.anlizev ]; then
        . ~/.bashrc.anlizev
    fi

    export PATH

fi # if [[ -z $BASH_PROFILE_ALREADY_LOADED ]]

# WORKAROUND: screen for some reason loose the bash completions if they not sourdes again
if type brew &>/dev/null; then
    for COMPLETION in $(brew --prefix)/etc/bash_completion.d/*
    do
        [[ -f $COMPLETION ]] && source "$COMPLETION" >& /dev/null
    done

    if [[ -f $(brew --prefix)/etc/profile.d/bash_completion.sh ]];
    then
        source "$(brew --prefix)/etc/profile.d/bash_completion.sh"
    fi
fi
