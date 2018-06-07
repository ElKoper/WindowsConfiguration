# git aliases
alias gitc="git checkout"
alias gitb="git branch"
alias gitr="git rebase"
alias gitri="git rebase -i"
alias gitd="git diff"
alias gitds="git diff --stat"
alias gits="git fetch && git status"
alias gitco="git commit"
alias gitcaa="git commit -a --amend"
alias gitwh="git whatchanged"
alias gitf="git fetch --prune"
alias gitgc="git gc --aggressive --prune=now"

gitimgd(){
	if (( $# < 3 )) ; then
		git difftool -x git-imgdiff -y $1 $2 -- *.png
	else
		git difftool -x git-imgdiff -y $@
	fi
}
alias gtiimgd="gitimgd"
#alias gitk="git log --oneline --graph --decorate"

git_old_remote(){
	if (( $# != 1 )) ; then
		echo "Exactly one argument is expected. (Part of autor name)"
	else
		for branch in `git branch -r | grep -v HEAD`;do echo -e `git show --format="%ai  %ar  by %an" $branch | head -n 1` \\t$branch; done | sort -r | grep -i $1
	fi
}

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
__git_complete gitf _git_fetch

__git_complete gitimgd _git_diff

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
