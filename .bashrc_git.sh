#git functions
__git_current_branch(){
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

gitpu(){
	git push -u origin `__git_current_branch`
}

gitbr(){
	for branch in `git branch -r | grep -v HEAD`; do
		git log -1 --pretty="%ci %<(15)%cr %<(27)%an %D" $branch
	done | sort -r | cut -c27-
}

gitb(){
	for branch in $(git branch | sed s/\*//); do
		git log -1 --pretty="%ci %<(15)%cr %<(27)%an %D" $branch
	done | sort -r | cut -c27-
}

gitb_old(){
	for branch in $(git branch | sed s/\*//); do
		if [ -z "$(git log -1 --since='7 days ago' -s $branch)" ]; then
			git log -1 --pretty="%ci %<(15)%cr %<(27)%an %D" $branch
			#git branch -D $branch
		fi
	done | sort -r | cut -c27-
}


# git aliases
alias gitc="git checkout"
alias gitcaa="git commit -a --amend"
alias gitco="git commit"
alias gitcom="git commit -m"
alias gitd="git diff"
alias gitds="git diff --stat"
alias gitf="git fetch --prune"
alias gitl='git log --pretty=format:"%h  %ad  %<(18)%an  %C(yellow)%s%C(green) %d " --date=short'
alias gitmdev="git fetch origin develop:develop ; git merge develop"
alias gitr="git rebase"
alias gitri="git rebase -i"
alias gits="gitf ; git status"
alias gitss="git status"
alias gitwh="git whatchanged"

alias gitgc="git gc --aggressive --prune=now"
alias gitwip="git commit -am '.'"
alias gitfix="git commit -am 'Resolve issues pointed in review'"
gitimgd(){
	if (( $# < 3 )) ; then
		git difftool -x git-imgdiff -y $1 $2 -- *.png
	else
		git difftool -x git-imgdiff -y $@
	fi
}


# enable tab completion in git aliases
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
