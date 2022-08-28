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

| Label       | Description                                                              |
| ----------- | ------------------------------------------------------------------------ |
| `master`    | Default branch                                                           |
| `origin`    | Upstream repository by default                                           |
| `HEAD`      | Current branch                                                           |
| `HEAD^`     | Parent branch of the current branch                                      |
| `HEAD~[N]`  | N-th parent of the current branch. Also `HEAD~~` is the same as `HEAD~2` |
| `ORIG_HEAD` | Previous state of `HEAD`                                                 |

## Commands

`Rebase`, `cherry-pick` and `merge` commands all have the following arguments:

* `--continue`
* `--abort`

### Main

| Command                          | Description                  |
| -------------------------------- | ---------------------------- |
| `git init [project]`             | Initialize a `project`       |
| `git merge [branch]`             | Merge `branch`               |
| `git pull`                       | Pull                         |
| `git push`                       | Push                         |
| `git push -f`                    | Force push                   |
| `git status`                     | Show the working tree status |
| `git revert [commit]`            | Revert a `commit`            |
| `git cherry-pick [commit]`       | Add a `commit`               |
| `git push --delete origin [tag]` | Delete a `tag` from origin   |

### Miscellaneous

| Command                                                        | Description                                            |
| -------------------------------------------------------------- | ------------------------------------------------------ |
| `git remot­e add origi­n git@g­ithub.com:[user]/[project].git` | Set origin                                             |
| `git rm [file]`                                                | Remove `file` from the working tree and from the index |
| `git mv [file-original] [file-moved]`                          | Move a file                                            |
| `git merge-base [branch1] [branch2]`                           | Find as good common ancestors as possible for a merge  |
| `git reflog`                                                   | Manage reflog information                              |

### Show

| Command                               | Description                                                          |
| ------------------------------------- | -------------------------------------------------------------------- |
| `git show [commit]`                   | Show commit changes                                                  |
| `git show :1:[file] > [file-common]`  | On merge conflicts, save common ancestor to `file-common`            |
| `git show :2:[file] > [file-current]` | On merge conflicts, save current changes to `file-current`           |
| `git show :3:[file] > [file-other]`   | On merge conflicts, save changes of the other branch to `file-other` |

### Clone

| Command                 | Description                   |
| ----------------------- | ----------------------------- |
| `git clone [url]`       | Clone a repository            |
| `git clone [url] [dir]` | Clone a repository to a `dir` |

### Branch

| Command                  | Description                           |
| ------------------------ | ------------------------------------- |
| `git branch`             | List all local branches               |
| `git branch -r`          | List all remote branches              |
| `git branch -a`          | List all local and remote branches    |
| `git branch -D [branch]` | Delete a `branch`                     |
| `git branch -m [branch]` | Rename the current branch to `branch` |
| `git branch [branch]`    | Create a new `branch`                 |

### Switch/Checkout

| Command                                               | Description                                                   |
| ----------------------------------------------------- | ------------------------------------------------------------- |
| `git switch [branch]` / `git checkout [branch]`       | Switch to a `branch`                                          |
| `git switch -c [branch]` / `git checkout -b [branch]` | Create a new `branch` and switch to it                        |
| `git checkout -b [new-branch] [existing-branch]`      | Create a new `branch` from `existing-branch` and switch to it |

### Log

| Command                                  | Description                                                                                                                      |
| ---------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `git log`                                | Show commit logs                                                                                                                 |
| `git log --oneline`                      | Show logs in a one-line format with shortened commit SHAs                                                                        |
| `git log --follow [file]`                | Continue listing the history of a `file` beyond renames                                                                          |
| `git log --all --full-history -- [file]` | Show history for a `file` even if it was deleted                                                                                 |
| `git log -n [N]`                         | Show logs for `N` last commits                                                                                                   |
| `git log --grep="[pattern]"`             | Limit the commits output to ones with log message<br> that matches the specified `pattern` (regular expression)                  |
| `git log --author="[pattern]"`           | Limit the commits output to ones with author/committer<br> header lines that match the specified `pattern` (regular expression). |
| `git log [commit1]..[commit2]`           | Show logs between `commit1` and `commit2`                                                                                        |

### Diff

| Command                                                | Description                               |
| ------------------------------------------------------ | ----------------------------------------- |
| `git diff`                                             | Show changes you made in the working tree |
| `git diff --staged`                                    | View the changes you staged               |
| `git diff [branch1/commit1] [branch2/commit2]`         | Show diff between 2 branches or commits   |
| `git diff --word-diff [commit1] [commit2] --unified=0` | Show a word diff and hide context         |

### Add

| Command             | Description                                                                                                                                                          |
| ------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `git add .`         | Stage all files                                                                                                                                                      |
| `git add -i`        | Add modified contents in the working tree interactively to the index.<br>Optional path arguments may be supplied to limit operation to a subset of the working tree. |
| `git add -N [file]` | Record only the fact that the path will be added later.<br>An entry for the path is placed in the index with no content.                                             |

### Reset/Checkout

| Command                                       | Description                           |
| --------------------------------------------- | ------------------------------------- |
| `git restore [file] / git checkout -- [file]` | Removes all changes to `file`         |
| `git reset --hard / git checkout -f`          | Remove all changes to the last commit |

### Reset

| Command                       | Description                                                |
| ----------------------------- | ---------------------------------------------------------- |
| `git reset`                   | Unstage all files                                          |
| `git reset --merge ORIG_HEAD` | Cancel a previous merge                                    |
| `git reset [file]`            | Unstage `file`                                             |
| `git reset [commit]`          | Reset to `commit`                                          |
| `git reset [commit] --hard`   | Reset to `commit` and remove all changes after this commit |

### Reset

| Command                  | Description                        |
| ------------------------ | ---------------------------------- |
| `git rebase [branch]`    | Reapply commits on top of `branch` |
| `git rebase -i [branch]` | Interactive rebase                 |

### Clean

| Command        | Description                                            |
| -------------- | ------------------------------------------------------ |
| `git clean -n` | List files which would be deleted by the command below |
| `git clean -f` | Delete untracked files                                 |

### Commit

| Command                                          | Description                                                                     |
| ------------------------------------------------ | ------------------------------------------------------------------------------- |
| `git commit`                                     | Commit                                                                          |
| `git commit -m"[message]"`                       | Commit with a message                                                           |
| `git commit -a`                                  | Commit all changed files except for untracked files. Also, delete deleted files |
| `git commit --amend`                             | Amend a commit (with staged files)                                              |
| `git commit --amend --no-edit`                   | Amend a commit without changing the commit message                              |
| `git commit --amend --author="[Name] <[email]>"` | Change the author of previous commit                                            |

### Commit

| Command                   | Description                    |
| ------------------------- | ------------------------------ |
| `git stash`               | Stash changes                  |
| `git stash pop`           | Pop the last stashed changed   |
| `git stash pop [stash]`   | Pop the changes from `stash`   |
| `git stash apply [stash]` | Apple the changes from `stash` |
| `git stash list`          | List stashes                   |
| `git stash drop [stash]`  | Drop `stash`                   |
| `git stash show [stash]`  | Show `stash` changes           |
| `git stash clear`         | Clear all stashes              |

### Blame

| Command                                       | Description                                                       |
| --------------------------------------------- | ----------------------------------------------------------------- |
| `git blame [file]`                            | Show what revision and author last modified each line of a `file` |
| `git blame -L [line-start],[line-end] [file]` | Annotate only the line range given by `line-start`, `line-end`    |

### Ls-files

| Command                                             | Description                                          |
| --------------------------------------------------- | ---------------------------------------------------- |
| `git ls-files --other --ignored --exclude-standard` | List all ignored files                               |
| `git ls-files -v \| grep "^[[:lower:]]"`            | Get a list of files marked with `--assume-unchanged` |

### Update-index

| Command                                         | Description                                     |
| ----------------------------------------------- | ----------------------------------------------- |
| `git update-index --assume-unchanged [file]`    | Ignore `file` without adding it go `.gitignore` |
| `git update-index --no-assume-unchanged [file]` | Remove `--assume-unchanged` mark for a `file`   |

### Update-index

| Command                                      | Description                                     |
| -------------------------------------------- | ----------------------------------------------- |
| `git update-index --assume-unchanged [file]` | Ignore `file` without adding it go `.gitignore` |

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

Delete the relevant section from the `.gitmodules` file

```bash
git add .gitmodules
```

Delete the relevant section from `.git/config`

```bash
git rm --cached [path-to-submodule]  # (no trailing slash)
rm -rf .git/modules/[path-to-submodule]
git commit -m "Removed submodule [name]"
rm -rf [path-to-submodule]
```

## How to Update Branch With Upstream

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

```bash
# in Linux
TRUE=/bin/true
# in macOS
TRUE=/usr/bin/true

git config diff.nodiff.command $TRUE
# Assign the new diff driver to those files you want to be ignored
FILE="[file]"
echo "$FILE diff=nodiff" >> .git/info/attributes
```

### Remove Data From Repository’s History

[Removing sensitive data from a repository](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository)
