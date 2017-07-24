# Pull alphine-node-6 image
FROM mhart/alpine-node:6

# Install build tools for node_modules
RUN apk add --update build-base python

# Install Git
RUN apk add git

# Create app directory
RUN mkdir -p /usr/local/deepstream/conf
WORKDIR /usr/local/deepstream

# Install deepstream as an application dependency
RUN npm install deepstream.io deepstream.io-logger-winston deepstream.io-msg-redis deepstream.io-cache-redis deepstream.io-storage-rethinkdb --production

# Link to volumes
VOLUME [ "$(pwd)/conf", "/usr/local/deepstream/var" ]

# Define default command.
CMD [ "node", "node_modules/.bin/deepstream" ]

# Expose ports

# HTTP Port
EXPOSE 6020

# TCP Port
EXPOSE 6021