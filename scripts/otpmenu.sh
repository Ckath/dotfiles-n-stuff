#!/usr/bin/env bash
# bodged from passmenu to get otp codes in pass with dmenu picker
# requires as-provided secrets in totp/ of passtore

shopt -s nullglob globstar

prefix=${PASSWORD_STORE_DIR-~/.password-store}
password_files=( "$prefix"/totp/**/*.gpg )
password_files=( "${password_files[@]#"$prefix"/}" )
password_files=( "${password_files[@]%.gpg}" )

password=$(printf '%s\n' "${password_files[@]}" | dmenu "$@")

[[ -n $password ]] || exit

pass show "$password" | base32 -d | totp | xclip -selection clipboard
