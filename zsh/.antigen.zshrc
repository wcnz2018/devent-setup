# vim: syntax=zsh

source "$HOME/.antigen/antigen.zsh"

antigen bundle robbyrussell/oh-my-zsh lib/

antigen bundle git
antigen bundle colored-man-pages
antigen bundle emoji
antigen bundle extract
antigen bundle cp
antigen bundle copydir
antigen bundle copybuffer
antigen bundle copyfile
antigen bundle dircycle
antigen bundle colorize
antigen bundle httpie
antigen bundle jump
antigen bundle nmap
antigen bundle web-search
antigen bundle iterm2
antigen bundle zsh-users/zsh-autosuggestions

antigen bundle desyncr/auto-ls
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle hlissner/zsh-autopair
antigen bundle Tarrasch/zsh-bd
antigen bundle mollifier/cd-gitroot
antigen bundle P4Cu/cd-reporoot
antigen bundle voronkovich/gitignore.plugin.zsh
antigen bundle Tarrasch/zsh-colors

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_first_and_last
POWERLEVEL9K_DIR_SHOW_WRITABLE=true
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_CONTEXT_TEMPLATE="%n"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs ssh root_indicator background_jobs history ram load)
POWERLEVEL9K_DIR_PATH_FOREGROUND=152
POWERLEVEL9K_DIR_PATH_BACKGROUND=237
antigen theme romkatv/powerlevel10k powerlevel9k

antigen apply
