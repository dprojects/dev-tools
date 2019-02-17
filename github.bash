#!/bin/bash

################################################################################
# info
################################################################################

echo -e "*********************************************************************";
echo -e "*";
echo -e "* Current settings:";
echo -e "*";
printf "* %-10s : %-30s \n" "Name: " "`git config --global user.name`"
printf "* %-10s : %-30s \n" "E-mail: " "`git config --global user.email`"
echo -e "*";
echo -e "* Usage:";
echo -e "*";
printf "* %-10s : %-30s \n" "User" "bash `basename $0` --set [USER]";
printf "* %-10s : %-30s \n" "New" "bash `basename $0` --init [URL]";
printf "* %-10s : %-30s \n" "Update" "bash `basename $0` --update [MSG]";
echo -e "*";
echo -e "*********************************************************************";

################################################################################
# git user
################################################################################

if [[ $1 == "--set" && $2 != "" ]];then

  GITHUB_USER="$2"

  git config --global user.name "${GITHUB_USER}"
  git config --global user.email "${GITHUB_USER}@users.noreply.github.com"

  echo -e "";
  echo -e "New settings:";
  echo -e "";
  printf "%-20s : %-30s \n" "User name: " "`git config --global user.name`"
  printf "%-20s : %-30s \n" "User email: " "`git config --global user.email`"
  echo -e "";

fi

################################################################################
# git init
################################################################################

if [[ $1 == "--init" && $2 != "" ]];then

  PROJECT="$2"

  git init;
  git add .;
  git commit -m \"init\";
  git remote add origin "${PROJECT}";
  git push -u origin master;

fi

##############################################################
# git update
##############################################################

if [[ $1 == "--update" && $2 != "" ]];then

  COMMIT_MSG="$2";

  git init;
  git add .;
  git commit -m "${COMMIT_MSG}";
  echo -e "All fine? Submit?: (y) or (n): \c"; read ANS;
  if [ "${ANS}" == "y" ]; then
    git push;
  fi

fi

##############################################################
echo -e "";
