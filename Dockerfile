# Pull base image.
FROM mhart/alpine-node:4

# Install build tools to compile native npm modules
RUN apk add --update build-base python

# Create app directory
RUN mkdir -p /usr/local/deepstream/conf
WORKDIR /usr/local/deepstream

# Install deepstream as an application dependency
RUN npm install deepstream.io deepstream.io-logger-winston --production

# Link to volumes
VOLUME [ "/usr/local/deepstream/conf", "/usr/local/deepstream/var" ]

# Copy default config files
RUN cp -r /usr/local/deepstream/node_modules/deepstream.io/conf/* /usr/local/deepstream/conf

# Define default command.
CMD [ "node", "node_modules/.bin/deepstream" ]

# Expose ports

# HTTP Port
EXPOSE 6020

# TCP Port
EXPOSE 6021