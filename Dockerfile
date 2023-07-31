# Define from what image we want to build from
FROM node:20.5.0-alpine3.17

# We have to install nodemon globally before moving into the working directory
RUN npm install -g nodemon

# Create app directory to hold the application code inside the image
WORKDIR /usr/src/app

# The image comes with Node.js and NPM already installed so the next thing we need to do is to install your app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install && npm cache clean --force
# If you are building your code for production
# RUN npm ci --omit=dev

# Bundle app source
COPY . .

RUN set DEBUG=node-docker-test:*

EXPOSE ${PORT}
CMD npm start