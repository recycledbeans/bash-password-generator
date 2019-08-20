#!/bin/bash

PASSWORD_SALT_LOCATION=~/.generate-password-salt

make_md5_hash () {

  # IF SYSTEM USES MD5 COMMAND
  if type "md5" > /dev/null 2>&1; then
    HASH=$(echo -n "$1" | md5)
  fi

  # IF SYSTEM USES MD5SUM
  if type "md5sum" > /dev/null 2>&1; then
    HASH=$(echo -n "$1" | md5sum | awk '{ print $1 }')
  fi

  echo -n "$HASH"

  return 1
}

# SALT REQUIRED TO BE SET BY USER
if [ -z "$SALT_FOR_PASSWORD" ]
then

  if [ ! -f $PASSWORD_SALT_LOCATION ]
  then
    echo date | make_md5_hash > $PASSWORD_SALT_LOCATION
  fi

  if [ ! -f $PASSWORD_SALT_LOCATION ]
  then
    echo "A password salt could not be created in your home directory at $PASSWORD_SALT_LOCATION"
    echo "Please manually create a random string within the file mentioned above."
    exit 0
  fi

  SALT_FOR_PASSWORD=$(cat $PASSWORD_SALT_LOCATION)

fi

# UNIQUE KEYWORD OR URL TO BE USED TO GENERATE PASSWORD
if [ -z "$1" ]
then
  echo "You must specify a keyword (like a URL) for the password"
  exit 0
fi

NEW_PASSWORD=$(make_md5_hash "$1.$SALT_FOR_PASSWORD" | base64 | sed -E "s/^(.{6})(.{6})(.{3})(.{3})(.*)/\1#\2_\4\3/g")

# COPY TO CLIPBOARD IF USER HAS PBCOPY (MAC)
if type "pbcopy" > /dev/null 2>&1; then
  echo "Copied to your default clipboard with pbcopy!"
  echo -n "$NEW_PASSWORD" | pbcopy
  echo "$NEW_PASSWORD"
  exit 1
fi

# COPY TO CLIPBOARD IF XCLIP IS INSTALLED (LINUX)
if type "xclip" > /dev/null 2>&1; then
  echo "Copied to your default clipboard with xclip!"
  echo -n "$NEW_PASSWORD" | xclip
  echo "$NEW_PASSWORD"
  exit 1
fi

echo "$NEW_PASSWORD"
