#!/bin/bash

username="easy"
password="easy"
host="10.10.56.44"
port=22

expect -c "
  spawn rsync -av -e ssh  --exclude=".git/" --exclude=".git/*" --exclude=".idea/" --exclude=".idea/*" . $username@$host:~/ds-yibasuo/
  expect {
    *yes/no* { send -- yes\r;exp_continue; }
    *assword* { send -- $password\r; }
  }
  interact
"