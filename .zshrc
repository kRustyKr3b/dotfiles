export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export QT_QPA_PLATFORMTHEME=qt5ct
export MANPAGER="nvim -c 'set ft=man' -"

HISTFILE=/home/rus_og/.config/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt sharehistory extendedhistory autocd
xset r rate 200 30
xset b off
setxkbmap -layout us,mk -option 'grp:rctrl_rshift_toggle'
zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*' menu select
zmodload zsh/complist
autoload -Uz compinit && compinit
PS1="%B%F{$(cat ~/prompt_cols | cut -d. -f1)}[%n%f%F{#888888}@%f%F{$(cat ~/prompt_cols | cut -d. -f2)}%m %1~]%(#.#.$)%f%b "

alias zrc='sudo nvim ~/.zshrc'
alias irc='sudo nvim ~/.config/i3/config'
alias prc='nvim ~/.config/polybar/config.ini'
alias drc='nvim ~/suckless/dwm-6.2/config.h'
alias xrc='sudo nvim /usr/local/bin/startdwm'
alias ch='cp ~/suckless/dwm-6.2/config.h ~/dotfiles'
alias vrc='sudo vim ~/.vimrc'
alias nvrc='sudo nvim ~/.config/nvim/init.vim'
alias arc='nvim ~/.config/alacritty/alacritty.yml'

alias sv='sudo vim'
alias sn='sudo nvim'
alias sp='sudo pacman'
alias n='nvim'
alias B='bluetoothctl'
alias R='ranger'
alias rr='rustc'
alias S='startx'
alias N='neofetch'
alias T='nvim to-do.md'
alias IP='curl ifconfig.co'
alias MD='/home/shaolinrus/suckless/dwm-6.2 && sudo make clean install && cd '
alias ka='killall'
alias stl='sudo systemctl'
alias ls='ls -F --color=auto --group-directories-first'
alias la='ls -FA --color=auto --group-directories-first'
alias rp='nvim /home/rus_og/raspored'
alias ci='cpupower frequency-info | grep policy -A 2'
alias hs='history 1'

alias -s pdf=zathura
alias -s jpg=sxiv
alias -s jpeg=sxiv
alias -s png=sxiv
alias -s bmp=sxiv
alias -s txt=nvim
alias -s md=nvim
alias -s c=nvim
alias -s cpp=nvim


typeset -A key
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}" reverse-menu-complete
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# # Finally, make sure the terminal is in application mode, when zle is
# # active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
 	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
 	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
 	fi

cat ~/.cache/wal/sequences
source ~/.cache/wal/colors-tty.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
