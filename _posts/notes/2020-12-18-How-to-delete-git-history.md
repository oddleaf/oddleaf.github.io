---
date: 2021-01-18
modified_date: 2023/02/16 12:18
lang: en
categories: Git
title: How to delete git history
---
Step 1: remove all history (**WARNING: can't be undone!**{:.red})

```bash
cd repo
rm -rf .git
```

Step 2: reconstruct git repo

```bash
git init
git add .
git commit -m "Deleted git history"
```

Step 3: push to GitHub

```bash
git remote add origin <repo-url>
git push -u --force origin master
```

Note:  
You can replace `<repo-url>` above with:
- your repository URL (eg. `https://github.com/oddleaf/oddleaf.github.io`)
- or something like `git@github.com:<username>/<repo>.git` (eg. `git@github.com:oddleaf/oddleaf.github.io.git`)

When pushing next time, you can simply use:

```bash
git push
```

----

**Source: [StackOverflow](https://stackoverflow.com/questions/9683279/make-the-current-commit-the-only-initial-commit-in-a-git-repository)**
