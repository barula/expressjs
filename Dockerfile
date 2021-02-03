FROM ubuntu:20.04
RUN apt update
# We directly answer the questions asked using the printf statement
RUN printf 'y\n1\n\1n' | apt install nodejs
RUN apt install -y npm
# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

# RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "node", "server.js" ]
