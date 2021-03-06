---
date: 2021-01-15 10:28
lang: en
categories: Git
title: How to use Dropbear with Github on Termux
---

1 - Generate private key:

```
dropbearkey -t rsa -s 4096 -f ~/.ssh/id_dropbear
```

<br />

2 - Calculate public key:

```
dropbearkey -y -f ~/.ssh/id_dropbear | grep '^ssh-rsa ' > ~/.ssh/id_dropbear.pub
```

<br />

3 - Create 'wrapper' for `ssh` (be careful of it's quote):

```
echo 'ssh -i ~/.ssh/id_dropbear $*' > ~/../usr/bin/ssh-id
chmod +x ~/../usr/bin/ssh-id
```

<br />

4 - Add this line into `~/.bashrc`:

```
export GIT_SSH=$HOME/../usr/bin/ssh-id
```

<br />

5 - Add SSH **public** key from step 2 to Github

<br />

6 - Replace remote url

```
git remote remove origin
git remote add origin git@github.com:<username>/<repo>.git
```

<br />

7 - Push

```
git push -u origin master
```

When pushing next time, you can simply use `git push`.

<br />

Done!

----

**References:**
- [Connecting to GitHub with SSH](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/connecting-to-github-with-ssh)
- [Setup Dropbear for GitHub development on Angstrom](http://remogatto.github.io/2011/03/09/setup-dropbear-for-github-development.html)
