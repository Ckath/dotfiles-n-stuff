#!/bin/sh
# shoddy script to get rid of invalid authors

[ -z "$1" ] && echo usage: gitrmauthor.sh notme@mail.org && exit 1
echo "$1" > /tmp/old_email # workaround for external arg in filter-branch
git filter-branch --env-filter '

OLD_EMAIL="$(cat /tmp/old_email)"
CORRECT_NAME="ckath"
CORRECT_EMAIL="ckat@teknik.io"

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
