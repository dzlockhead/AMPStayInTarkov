FROM cubecoders/ampbase

ARG SIT=-
ARG SIT_BRANCH=master
ARG SPT=-
ARG SPT_BRANCH=3.8.0
ARG NODE=20.11.1

# Install git git-lfs curl
RUN apt update && apt install -yq git git-lfs curl
# Install Node Version Manager and NodeJS
RUN git clone https://github.com/nvm-sh/nvm.git $HOME/.nvm || true
RUN \. $HOME/.nvm/nvm.sh && nvm install $NODE
RUN \. $HOME/.nvm/nvm.sh && npm install

ENTRYPOINT ["/ampstart.sh"]
CMD []

FROM ubuntu:latest AS builder
