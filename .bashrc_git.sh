#function used in aliases
git_current_branch(){
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}


# git aliases
alias gitb="git branch"
alias gitbr="git branch -r"
alias gitc="git checkout"
alias gitcaa="git commit -a --amend"
alias gitco="git commit"
alias gitcom="git commit -m"
alias gitd="git diff"
alias gitds="git diff --stat"
alias gitf="git fetch --prune"
alias gitl='git log --pretty=format:"%h  %ad  %<(18)%an  %C(yellow)%s%C(green) %d " --date=short'
alias gitpu="git push -u origin `git_current_branch`"
alias gitr="git rebase"
alias gitri="git rebase -i"
alias gits="gitf && git status"
alias gitss="git status"
alias gitwh="git whatchanged"

alias gitgc="git gc --aggressive --prune=now"
alias gitwip="git commit -am 'Work in progress'"
gitimgd(){
	if (( $# < 3 )) ; then
		git difftool -x git-imgdiff -y $1 $2 -- *.png
	else
		git difftool -x git-imgdiff -y $@
	fi
}


# enable tab completion in git aliases
__git_complete gitb _git_branch
__git_complete gitbr _git_branch
__git_complete gitc _git_checkout
__git_complete gitcaa _git_commit
__git_complete gitco _git_commit
__git_complete gitcom _git_commit
__git_complete gitd _git_diff
__git_complete gitds _git_diff
__git_complete gitf _git_fetch
__git_complete gitr _git_rebase
__git_complete gitri _git_rebase
__git_complete gitwh _git_whatchanged

__git_complete gitimgd _git_diff


# Helper and rare usage functions
gitbr_by_date(){
	for branch in `git branch -r | grep -v HEAD`;do echo -e `git show --format="%ci %cr" $branch | head -n 1` \\t$branch; done | sort -r
}

gitb_old(){
	for branch in $(git branch | sed /\*/d); do
	  if [ -z "$(git log -1 --since='21 days ago' -s $branch)" ]; then
		echo $branch
		#git branch -D $branch
	  fi
	done
}

# enable bash prompt states
export GIT_PS1_SHOWDIRTYSTATE=NON_EMPTY_VALUE 		# unstaged '*', staged '+'
export GIT_PS1_SHOWSTASHSTATE=NON_EMPTY_VALUE  		# stashed '$'
export GIT_PS1_SHOWUNTRACKEDFILES=NON_EMPTY_VALUE 	# untracked '%'
export GIT_PS1_SHOWUPSTREAM=NON_EMPTY_VALUE 		# behind "<", ahead ">", deverged "<>", no diff "="

#export GIT_PS1_SHOWCOLORHINTS NON_EMPTY_VALUE
#export GIT_PS1_HIDE_IF_PWD_IGNORED NON_EMPTY_VALUE
#export GIT_PS1_DESCRIBE_STYLE default
# Detached HEAD is show as:
#     contains      relative to newer annotated tag (v1.6.3.2~35)
#     branch        relative to newer tag or branch (master~4)
#     describe      relative to older annotated tag (v1.6.3.1-13-gdd42c2f)
#     tag           relative to any older tag (v1.6.3.1-13-gdd42c2f)
#     default       exactly matching tag
