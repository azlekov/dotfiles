#!/bin/sh
grep pam_tid /etc/pam.d/sudo >/dev/null || echo auth sufficient pam_tid.so | cat - /etc/pam.d/sudo | sudo tee /etc/pam.d/sudo > /dev/null
