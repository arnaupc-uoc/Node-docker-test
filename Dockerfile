# Define from what image we want to build from
FROM node:20.5.0-alpine3.17

# Create app directory to hold the application code inside the image
RUN mkdir -p usr/src/app
WORKDIR /usr/src/app

# The image comes with Node.js and NPM already installed so the next thing we need to do is to install your app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --omit=dev

RUN npm install -g nodemon

# Bundle app source
COPY . .

RUN set DEBUG=node-docker-test:*

EXPOSE 8080
CMD npm start