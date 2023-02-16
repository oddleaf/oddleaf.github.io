---
date: 2021-01-15 10:28
modified_date: 2023/02/16 12:10
lang: en
categories: Git
title: How to use Dropbear with Github on Termux
---

#### 1 - Generate private key:

```bash
dropbearkey -t rsa -s 4096 -f ~/.ssh/id_dropbear
```

#### 2 - Calculate public key:

```bash
dropbearkey -y -f ~/.ssh/id_dropbear | grep '^ssh-rsa ' > ~/.ssh/id_dropbear.pub
```

#### 3 - Create 'wrapper' for `ssh` (be careful of it's quote):

```bash
echo 'ssh -y -i ~/.ssh/id_dropbear $*' > ~/../usr/bin/ssh-id
chmod +x ~/../usr/bin/ssh-id
```

#### 4 - Add this line into `~/.bashrc`:

```bash
export GIT_SSH=$HOME/../usr/bin/ssh-id
```

#### 5 - Add SSH *public* key from step 2 to [Github SSH Keys](https://github.com/settings/ssh/new)

#### 6 - Replace remote URL

```bash
git remote remove origin
git remote add origin git@github.com:<username>/<repo>.git
```

#### 7 - Push

```bash
git push -u origin master
```

When pushing next time, you can simply use:

```bash
git push
```

----

**References:**
- [Connecting to GitHub with SSH](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/connecting-to-github-with-ssh)
- [Setup Dropbear for GitHub development on Angstrom](http://remogatto.github.io/2011/03/09/setup-dropbear-for-github-development.html)
