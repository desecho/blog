---
title: "Git"
date: 2014-06-22T00:24:00
comments: true
categories: Git
keywords: git, source control
---

* [Git](http://git-scm.com/)
* [Git Documentation](https://git-scm.com/doc)

## Basics
* `master` : default branch
* `origin` : upstream repository by default
* `HEAD` : current branch
* `HEAD^` : parent branch of the current branch
* `HEAD~~` or `HEAD~2` : n-th parent of the current branch

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
git branch -D [branch]  # Delete [branch]
git branch -m [branch]  # Rename current branch to [branch]
git branch [branch]  # Create [branch]

git checkout [branch] # Switch to [branch]
git switch [branch] # Switch to [branch]
git checkout -b [branch]  # Create a new [branch] and switch to it
git switch -c [branch]  # Create a new [branch] and switch to it
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
git add -N [file]  # Just add a file to the tracking

git checkout -- [file] # Removes all changes to [file]
git restore [file] # Removes all changes to [file]
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
git commit -a  # Commit all changed files except for untracked files. Also, delete deleted files
git commit --amend  # Amend a commit (with staged files)
git commit --amend --author="[Name] <[email]>"  # Change the author of previous commit
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
git reset --merge ORIG_HEAD  # Cancel a previous merge

# On conflicts:
git show :1:[file] > [file1]  # Common ancestor
git show :2:[file] > [file2]  # Version from current branch
git show :3:[file] > [file3]  # Version from test branch
```

## Submodules
### Initiate Submodules and Load Them
```bash
git submodule init
git submodule update
```

### How to Add a Submodule
```bash
git submodule add http://github.com/[username]/[repo].git my/path
```

### How to Remove a Submodule
1. Delete the relevant section from the .gitmodules file
2. `git add .gitmodules`
3. Delete the relevant section from .git/config
4. `git rm --cached [path-to-submodule]  # (no trailing slash)`
5. `rm -rf .git/modules/[path-to-submodule]`
6. `git commit -m "Removed submodule [name]"`
7. `rm -rf [path-to-submodule]`

# Update Branch With Upstream
```bash
git remote add upstream https://github.com/[user]/[project].git
git fetch upstream
git checkout master
git rebase upstream/master
```

## Tips

### Ignore Files Without Adding Them to .gitignore
Edit file `.git/info/exclude`

### Ignore Files Only in Diff Command
Create a repository specific diff driver:

* in Linux:
    * `TRUE=/bin/true`
* in macOS:
    * `TRUE=/usr/bin/true`

`git config diff.nodiff.command $TRUE`

Then, assign the new diff driver to those files you want to be ignored:
```bash
echo "[file]    diff=nodiff" >> .git/info/attributes
```

## Remove Data From Repository’s History
[Removing sensitive data from a repository](https://help.github.com/articles/removing-sensitive-data-from-a-repository/)
