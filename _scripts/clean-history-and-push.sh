cd $(dirname "$0")/..
#pwd
rm -rf .git

git init
git add .
git commit -m 'cleaned history'
git remote add origin git@github.com:oddleaf/oddleaf.github.io.git
git push -u --force origin master
