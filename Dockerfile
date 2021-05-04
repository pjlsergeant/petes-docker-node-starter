FROM alpine:3.13.5

RUN apk --update add nodejs npm
# RUN apk --update add busybox-extras screen

RUN adduser -D 50a2fabfdd276f573ff97ace8b11c5f4
USER 50a2fabfdd276f573ff97ace8b11c5f4

# Code will go in deploy/
RUN mkdir /home/50a2fabfdd276f573ff97ace8b11c5f4/deploy/
WORKDIR /home/50a2fabfdd276f573ff97ace8b11c5f4/deploy/

# Copy package.json first and install so we don't redo dep install unless it's
# actually changed. Also we're going to install node_modules in the _parent_
# directory so that we don't pollute our workspace here
COPY package*.json ./
# might not be anything to install...
RUN mkdir node_modules
RUN npm install && mv node_modules ../

# Copy the code itself
COPY . .

ENTRYPOINT ["/home/50a2fabfdd276f573ff97ace8b11c5f4/deploy/init.sh"]

