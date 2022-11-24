ZSHD=~/.zsh.d
for env_snippet in ${ZSHD}/env/*[^~]
do
    export $(basename $env_snippet)="$(eval "echo $(cat $env_snippet)")"
done
source ${ZSHD}/antigen.zsh
antigen use oh-my-zsh
for bundle in ${ZSHD}/antigen_bundles/*[^~]
do
    antigen bundle "$(basename "$bundle" | sed 's/\\/\//')"
done
[ -n "$ZSH_THEME" ] && antigen theme "$ZSH_THEME"
antigen apply

fpath=(${ZSHD}/autocomplete ${ZSHD}/functions $fpath)
for f in ${ZSHD}/autocomplete/*[^~] ${ZSHD}/functions/*[^~]
do
    autoload $f
done
for zshrc_snippet in ${ZSHD}/rc/S[0-9][0-9]*[^~]
do
    source $zshrc_snippet
done
for alias_snippet in ${ZSHD}/alias/*[^~]
do
    alias $(basename $alias_snippet)="$(cat $alias_snippet)"
done



#zstyle :omz:plugins:ssh-agent agent-forwarding on
#zstyle :omz:plugins:ssh-agent identities id_rsa
#export ZSH=~/.antigen/bundles/robbyrussell/oh-my-zsh
## .zsh.d/functions
#if [ ! -e "$ZSHD" ]; then ZSHD=~/.zsh.d; fi
#
## .zsh.d/env
## .zsh.d/alias
## .zsh.d/rc
