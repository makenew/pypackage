#!/usr/bin/env sh

set -e
set -u

find_replace () {
  git grep --cached -Il '' | xargs sed -i.sedbak -e "$1"
  find . -name "*.sedbak" -exec rm {} \;
}

sed_insert () {
  sed -i.sedbak -e "$2\\"$'\n'"$3"$'\n' $1
  rm $1.sedbak
}

sed_delete () {
  sed -i.sedbak -e "$2" $1
  rm $1.sedbak
}

check_env () {
  test -d .git || (echo 'This is not a Git repository. Exiting.' && exit 1)
  for cmd in ${1}; do
    command -v ${cmd} >/dev/null 2>&1 || \
      (echo "Could not find '$cmd' which is required to continue." && exit 2)
  done
  echo
  echo 'Ready to bootstrap your new project!'
  echo
}

stage_env () {
  echo
  echo 'Removing origin and tags.'
  git tag | xargs git tag -d
  git branch --unset-upstream
  git remote rm origin
  echo
  git rm -f makenew.sh
  echo
  echo 'Staging changes.'
  git checkout poetry.lock
  git add --all
  echo
  echo 'Done!'
  echo
}

makenew () {
  echo 'Answer all prompts.'
  echo 'There are no defaults.'
  echo 'Example values are shown in parentheses.'
  read -p '> Package title (My Package): ' mk_title
  read -p '> Package name (my-package): ' mk_slug
  read -p '> Module name (my_package): ' mk_module
  read -p '> Package description: ' mk_description
  read -p '> Author name (Linus Torvalds): ' mk_author
  read -p '> Author email (linus@example.com): ' mk_email
  read -p '> GitHub user or organization name (my-user): ' mk_user
  read -p '> GitHub repository name (my-repo): ' mk_repo

  sed_delete README.rst '18,128d'
  sed_insert README.rst '18i' 'TODO'

  old_title="Python Package Skeleton"
  old_title_length=${#old_title}
  new_title_length=${#mk_title}
  old_title_underline=""
  new_title_underline=""
  for ((i=1;i<=old_title_length;i++)); do old_title_underline="${old_title_underline}="; done
  for ((i=1;i<=new_title_length;i++)); do new_title_underline="${new_title_underline}="; done

  find_replace "s/^version = \".*/version = \"0.0.0\"/g"
  find_replace "s/current_version = .*/current_version = 0.0.0/g"
  find_replace "s/${old_title}/${mk_title}/g"
  find_replace "s/${old_title_underline}/${new_title_underline}/g"
  find_replace "s/Package skeleton for a Python module\./${mk_description}/g"
  find_replace "s/2024 Evan Sosenko/2023 ${mk_author}/g"
  find_replace "s/Evan Sosenko/${mk_author}/g"
  find_replace "s/razorx@evansosenko\.com/${mk_email}/g"
  find_replace "s/makenew\/pypackage/${mk_user}\/${mk_repo}/g"
  find_replace "s/makenew-pypackage/${mk_slug}/g"
  find_replace "s/makenew_pypackage/${mk_module}/g"

  git mv makenew_pypackage ${mk_module}

  echo
  echo 'Replacing boilerplate.'
}

check_env 'git read sed xargs'
makenew
stage_env
exit
