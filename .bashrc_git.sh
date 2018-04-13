# git aliases
alias gitc="git checkout"
alias gitb="git branch"
alias gitr="git rebase"
alias gitri="git rebase -i"
alias gitd="git diff"
alias gitds="git diff --stat"
alias gitpngd=""
alias gits="git status"
alias gitco="git commit"
alias gitcaa="git commit -a --amend"
alias gitwh="git whatchanged"

alias gti="git"
alias gtic="gitc"
alias gtib="gitb"
alias gtir="gitr"
alias gtiri="gitri"
alias gtid="gitd"
alias gtids="gitds"
alias gtis="gits"
alias gtico="gitco"
alias gticaa="gitcaa"
alias gtiwh="git whatchanged"

gitimgd(){
	git difftool -x git-imgdiff -y $1 $2 -- *.png 
}
alias gtiimgd="gitimgd"
#alias gitk="git log --oneline --graph --decorate"


# enable tab completion in git aliases
__git_complete gitc _git_checkout
__git_complete gitb _git_branch
__git_complete gitr _git_rebase
__git_complete gitri _git_rebase
__git_complete gitd _git_diff
__git_complete gitds _git_diff
__git_complete gitco _git_commit
__git_complete gitcaa _git_commit
__git_complete gitwh _git_whatchanged

__git_complete gtic _git_checkout
__git_complete gtib _git_branch
__git_complete gtir _git_rebase
__git_complete gtiri _git_rebase
__git_complete gtid _git_diff
__git_complete gtids _git_diff
__git_complete gtico _git_commit
__git_complete gticaa _git_commit
__git_complete gtiwh _git_whatchanged

__git_complete gitimgd _git_diff
__git_complete gtiimgd _git_diff

# enable bash prompt states
export GIT_PS1_SHOWDIRTYSTATE=NON_EMPTY_VALUE 		# unstaged '*', staged '+'
export GIT_PS1_SHOWSTASHSTATE=NON_EMPTY_VALUE  		# stashed '$'
export GIT_PS1_SHOWUNTRACKEDFILES=NON_EMPTY_VALUE 	# untracked '%'
export GIT_PS1_SHOWUPSTREAM=NON_EMPTY_VALUE 		# behind "<", ahead ">",
													# deverged "<>", no diff "="

#export GIT_PS1_SHOWCOLORHINTS NON_EMPTY_VALUE
#export GIT_PS1_HIDE_IF_PWD_IGNORED NON_EMPTY_VALUE
#export GIT_PS1_DESCRIBE_STYLE default
# Detached HEAD is show as:
#     contains      relative to newer annotated tag (v1.6.3.2~35)
#     branch        relative to newer tag or branch (master~4)
#     describe      relative to older annotated tag (v1.6.3.1-13-gdd42c2f)
#     tag           relative to any older tag (v1.6.3.1-13-gdd42c2f)
#     default       exactly matching tag
