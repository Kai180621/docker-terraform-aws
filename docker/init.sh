#!/bin/bash

source /root/.bashrc

if [[ ! -e /infra/.aws/config ]]; then
    mv /infra/.aws/config.default /infra/.aws/config
fi

if [[ ! -e /infra/.aws/credentials ]]; then
    mv /infra/.aws/credentials.default /infra/.aws/credentials
    sed -i "s/<access-key>/${AWS_ACCESS_KEY_ID}/g" /infra/.aws/credentials
    sed -i "s/<secret-key>/${AWS_SECRET_ACCESS_KEY}/g" /infra/.aws/credentials
fi