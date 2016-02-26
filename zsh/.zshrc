#! /bin/zsh

{
    # zmodload zsh/zprof # uncomment this line to enable profiling

    # utility function, volatile to this invocation
    function has_a() {
	whence "$@" >/dev/null 2>&1
	return $?
    }

    source $ZDOTDIR/zplug.zsh       # should be the very first
    source $ZDOTDIR/bindkey.zsh
    source $ZDOTDIR/setopts.zsh
    source $ZDOTDIR/exports.zsh     # has PATH setting, should load early
    source $ZDOTDIR/colors.zsh      # depends exports(PATH)
    source $ZDOTDIR/completions.zsh # depends colors(LS_COLORS)
    source $ZDOTDIR/helps.zsh
    source $ZDOTDIR/screen.zsh      # depends zplug(compinit)
    source $ZDOTDIR/predict-on.zsh
    source $ZDOTDIR/prompt.zsh
    source $ZDOTDIR/profiling.zsh

} always {

    unfunction has_a

}
