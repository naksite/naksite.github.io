if [ ! "${1}" == "" ] ; then
  rm -rf exampleSite/resources/_gen/*
  rm -rf exampleSite/public/*
  rm -rf resources/_gen/*
  rm -rf public/*

  hugo

  git add .
  git commit -m "$1"
  git push
else
  echo "Usage: $0 commit_message"
fi
