FROM node:14-alpine

# Create app directory, this is in our container/in our image
WORKDIR /app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY .  .

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

RUN npm rebuild node-sass
RUN nmp run build
EXPOSE 3000
CMD [ "nmp","start" ]