---
lang: en
categories: Git
title: How to delete git history
---
Step 1: remove all history (**can't be undone!**)

```
cd repo
rm -rf .git
```

Step 2: reconstruct git repo

```
git init
git add .
git commit -m "Deleted git history"
```

Step 3: push to GitHub

```
git remote add origin <github-url>
git push -u --force origin master
```

----

**Source: [StackOverflow](https://stackoverflow.com/questions/9683279/make-the-current-commit-the-only-initial-commit-in-a-git-repository)**
