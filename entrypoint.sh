#!/bin/bash

i=1
max=100
while [ "$i" -lt "$max" ]; do
  userVar="USER$i"
  if [ -z ${!userVar} ]; then
    break
  fi

  remainder="${!userVar}"
  name="${remainder%%:*}";  remainder="${remainder#*:}"
  uid="${remainder%%:*}"; remainder="${remainder#*:}"
  gid="${remainder%%:*}"; remainder="${remainder#*:}"
  password="${remainder}"

  groupadd -g $gid $name
  useradd --no-log-init -g $gid -u $uid $name
  echo -e "$password\n$password" | smbpasswd -a -s $name

  i=$((i + 1))
done

exec smbd --foreground --log-stdout --no-process-group
