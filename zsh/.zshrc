#! /bin/zsh

function () {
    # I know.  You can't read this line.  But it works.  For me.  At least.
    local here=${${${(%):-%N}:A}:h}

    {
	# utility function, volatile to this invocation
	function has_a() {
	    type "$@" >/dev/null 2>&1
	    return $?
	}

	# zmodload zsh/zprof # uncomment this line to enable profiling

	source $here/zplug.zsh       # should be the very first
	source $here/setopts.zsh
	source $here/exports.zsh     # has PATH setting, should load early
	source $here/colors.zsh      # depends exports(PATH)
	source $here/completions.zsh # depends colors(LS_COLORS)
	source $here/helps.zsh
	source $here/screen.zsh      # depends zplug(compinit)
	source $here/predict-on.zsh
	source $here/prompt.zsh
	source $here/profiling.zsh

    } always {

	unfunction has_a

    }
}
