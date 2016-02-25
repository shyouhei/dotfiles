#!/bin/zsh
# -*- mode: zsh -*-
# vim:ft=zsh
#
# *** ZPLUG EXTERNAL FILE ***
# You can register plugins or commands to zplug on the
# command-line. If you use zplug on the command-line,
# it is possible to write more easily its settings
# by grace of the command-line completion.
# In this case, zplug spit out its settings to
# zpluglocal.zsh instead of .zshrc.
# If you launch new zsh process, zplug load command
# automatically search this file and run source command.
#
#
# Example:
# zplug "b4b4r07/enhancd", as:plugin, of:"*.zsh"
# zplug "rupa/z",          as:plugin, of:"*.sh"
#
zplug b4b4r07/zplug
zplug zsh-users/zsh-completions
zplug zsh-users/zsh-history-substring-search
zplug zsh-users/zsh-syntax-highlighting, nice:10
zplug zsh-users/zaw, nice:10
zplug mrowa44/emojify, as:command, of:emojify
zplug djui/alias-tips
zplug willghatch/zsh-cdr
