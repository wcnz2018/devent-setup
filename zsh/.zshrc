export TERM=xterm-256color

# for macOS
function brew_command_not_found() {
	if brew command command-not-found-init > /dev/null; then
		eval "$(brew command-not-found-init)"
	fi
}

eval $(thefuck --alias)
[ -f /usr/local/etc/profile.d/autojump.sh ] && \
    . /usr/local/etc/profile.d/autojump.sh

[ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && \
    . /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source "$HOME/.antigen.zshrc"
unsetopt share_history

source ~/.alias
