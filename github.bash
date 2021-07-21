#!/bin/bash


# Author: Darek L (aka dprojects)
# Version: 2.0
# Latest version: https://github.com/dprojects/dev-tools


# ###################################################################################################################
# INFO
# ###################################################################################################################

echo -e "******************************************************************************************************";
echo -e "*";
echo -e "* Current settings:";
echo -e "*";
printf "* %-25s : %-30s \n" "Name" "`git config --global user.name`"
printf "* %-25s : %-30s \n" "Token (GITHUB_TOKEN)" "`echo ${GITHUB_TOKEN}`"
printf "* %-25s : %-30s \n" "E-mail" "`git config --global user.email`"
echo -e "*";
echo -e "* Usage:";
echo -e "*";
printf "* %-40s : %-30s \n" "Set active user" "bash `basename $0` --user [USER]";
printf "* %-40s : %-30s \n" "Create new repository and commit to it" "bash `basename $0` --init [URL]";
printf "* %-40s : %-30s \n" "Commit to current repository" "bash `basename $0` --update [MSG]";
echo -e "*";
echo -e "******************************************************************************************************";


# ###################################################################################################################
# Set active user
# ###################################################################################################################

if [[ $1 == "--user" && $2 != "" ]];then

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


# ###################################################################################################################
# Create new repository and commit to it
# ###################################################################################################################

if [[ $1 == "--init" && $2 != "" ]];then

  PROJECT="$2"
  COMMIT_MSG="init";

  git init;
  git add .;
  git commit -m "${COMMIT_MSG}";
  git remote add origin "${PROJECT}";
  git push -u origin master;

fi


# ###################################################################################################################
# Commit to current repository
# ###################################################################################################################

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


# ###################################################################################################################
echo -e "";
