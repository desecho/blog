---
title: "Git"
date: 2014-06-22T00:24:00
comments: true
categories: Git
keywords: git, source control
---

[Git](http://git-scm.com/)
[Git Documentation](https://git-scm.com/doc)

## Basics
* **master** : default branch
* **origin** : upstream repository by default
* **head** : current branch
* **head^** : parent branch of the current branch
* **head~~** or **head~2** : n-th parent of the current branch

## Commands
```bash
git init [project-name]
git clone [url] <dir>
git remot­e add origi­n git@g­ithub.com:[user]/[project].git

git pull
git push
git push -f  # Force push

git branch  # List all local branches
git branch -r  # List all remote branches
git branch -a  # List local and remote branches
git branch -D [branch]  # Delete a branch
git branch -m [branch]  # Rename current branch to [branch]
git branch [branch]  # Create a branch

git checkout [branch]
git checkout -b [branch]  # Create a new branch and checkout the new branch.
git checkout -b [new-branch] [existing-branch]

git status
git log
git log --oneline
git log --follow [file]
git log -n [limit]
git log --grep="[pattern]"
git log --author="[pattern]"
git log [commit1]..[commit2]

git show [commit]  # List commit changes
git diff
git diff --staged
git diff [old_commit_hash] [new_commit_hash]
git diff [old_branch] [new_branch]
git diff --word-diff [commit1] [commit2] --unified=0  # Show difference in words and
													  # hide context

git add .  # Stage all files
git add -p  # Interactive staging
git add -N [file]  # Just add a file to tracking

git checkout -- [file]  # Removes all changes to [file]
git checkout -f  # Remove all changes to the last commit
git reset --hard  # Remove all changes to the last commit

git reset
git reset [file]
git reset [commit]
git reset [commit] --hard  # Remove all changes to [commit]

git rebase [branch]
git rebase --continue
git rebase --abort
git rebase -i # Interactive rebase.
git rebase -i [branch]

git clean -n  # List files which would be deleted by the command below
git clean -f  # Delete untracked files

git revert [commit]

git commit -m'[commit message]'
git commit -a  # Commit all changed files accept for untracked files. Also delete deleted
			   # files.
git commit --amend  # Amend a commit (with staged files)
git commit --amend --author="Anton Samarchyan <desecho@gmail.com>"  # Change the author of previous commit
git commit --amend --no-edit  # Amend a commit without changing the commit message

git stash
git stash pop <stash>
git stash apply <stash>
git stash list
git stash drop <stash>
git stash show [stash]  # Show stash changes
git stash clear  # Remove all stashes

git rm [file]
git mv [file-original] [file-renamed]

git blame [file]
git blame -L [line_start],[line_end] [file]
git merge-base [branch1] [branch2]

git ls-files --other --ignored --exclude-standard  # List all ignored files
git update-index --assume-unchanged [file]
git update-index --no-assume-unchanged [file]
git ls-files -v | grep '^[[:lower:]]'  # List files flagged as "unchanged"
```

## Merging
```bash
git merge [branch]
git merge --abort
git reset --merge ORIG_HEAD  # Cancel previous merge

# On conflicts:
git show :1:[file] > [file1]  # Common ancestor
git show :2:[file] > [file2]  # Version from current branch
git show :3:[file] > [file3]  # Version from test branch
```

## Submodules
### Initiate submodules and load them
```
git submodule init
git submodule update
```

### How to add a submodule
```
git submodule add http://github.com/[username]/[repo].git my/path
```

### How to remove a submodule
1. Delete the relevant section from the .gitmodules file
2. `git add .gitmodules`
3. Delete the relevant section from .git/config
4. `git rm --cached [path_to_submodule]  # (no trailing slash)`
5. `rm -rf .git/modules/[path_to_submodule]`
6. `git commit -m "Removed submodule [name]"`
7. `rm -rf [path_to_submodule]`

# Update branch with upstream
```bash
git remote add upstream https://github.com/[user]/[project].git
git fetch upstream
git checkout master
git rebase upstream/master
```

## Tips

### Ignore files without adding it to .gitignore.
Edit file `.git/info/exclude`

### Ignore files only in diff command
Create a repository specific diff driver:

for Linux:
`$true = /bin/true`

for Mac OS:
`$true = /usr/bin/true`
`git config diff.nodiff.command $true`

Then, assign the new diff driver to those files you want ignored in your `.git/info/attributes` file.
`[file]    diff=nodiff`

## Remove data from repository's history

[Removing sensitive data from a repository](https://help.github.com/articles/removing-sensitive-data-from-a-repository/)
