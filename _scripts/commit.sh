[ "$#" -eq 0 ] && {
  echo needed argument: commit message.
  exit 1
}

cd $(dirname "$0")/..
pwd

git add .
git commit -m "$*"
