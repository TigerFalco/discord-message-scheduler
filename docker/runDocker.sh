#!/usr/bin/env bash

cd ..
docker kill discordmsgsch
printf "Building discordmsgsch image.\n"
docker build -f docker/Dockerfile --rm -t local/discordmsgsch -t 025221494343.dkr.ecr.us-east-1.amazonaws.com/rileystech:discordmsgsch .
printf "Running discordmsgsch image.\n"
docker run -d --rm --network proxynet --ip 172.30.0.19 --privileged -p 80:80 -p 443:443 -p 9000 --name discordmsgsch local/discordmsgsch

if [ "$1" = "push" ]; then
$(aws ecr get-login --no-include-email)
docker push 025221494343.dkr.ecr.us-east-1.amazonaws.com/rileystech:discordmsgsch
fi

cd docker

#RAILS_ENV=production bundle exec rake assets:precompile