#!/usr/bin/env bash

# AWS configuration
if [[ -n ${AWS_ACCESS_KEY_ID} ]] && [[ -n ${AWS_SECRET_ACCESS_KEY} ]] && [[ -n ${AWS_DEFAULT_REGION} ]]; then
  mkdir -p /root/.aws
  echo -e "[default]\noutput = json\nregion = ${AWS_DEFAULT_REGION}" > /root/.aws/config \
      && chmod 600 /root/.aws/config
  echo -e "[default]\naws_access_key_id = ${AWS_ACCESS_KEY_ID}\naws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" > /root/.aws/credentials \
      && chmod 600 /root/.aws/credentials
  export PATH=/root/.local/bin:$PATH
  echo 'export PATH=/root/.local/bin:$PATH' >> /etc/profile
fi

# Aliases
alias acm='python3 /opt/acm.py'
