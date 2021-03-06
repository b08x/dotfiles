local _old_path="$PATH"

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local

if [[ $PATH != $_old_path ]]; then
  # `colors` isn't initialized yet, so define a few manually
  typeset -AHg fg fg_bold
  if [ -t 2 ]; then
    fg[red]=$'\e[31m'
    fg_bold[white]=$'\e[1;37m'
    reset_color=$'\e[m'
  else
    fg[red]=""
    fg_bold[white]=""
    reset_color=""
  fi

  cat <<MSG >&2
${fg[red]}Warning:${reset_color} your \`~/.zshenv.local' configuration seems to edit PATH entries.
Please move that configuration to \`.zshrc.local' like so:
  ${fg_bold[white]}cat ~/.zshenv.local >> ~/.zshrc.local && rm ~/.zshenv.local${reset_color}

(called from ${(%):-%N:%i})

MSG
fi

unset _old_path

export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=1

export TERMINAL="terminator -b"

export PAGER=less

export NO_AT_BRIDGE=1 

export VAMP_PATH="$HOME/.vamp"
export LADSPA_PATH="/usr/lib/ladspa"

export ANSIBLE_HOME="$HOME/Workspace/ansible"
export ANSIBLE_CONFIG="$HOME/Workspace/ansible/ansible.cfg"

export HOSTNAME=`hostname`
