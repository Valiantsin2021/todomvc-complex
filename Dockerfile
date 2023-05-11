FROM ubuntu:latest

# install node.js
RUN apt-get update && apt-get -y upgrade && apt-get install -y curl && curl https://deb.nodesource.com/setup_18.x | apt-get install -y nodejs
# install npm
RUN apt-get install -y npm 
# set working directory
WORKDIR /app

# copy package.json to the working directory
COPY package.json /app

# install dependencies
RUN npm i

# copy app files to the working directory
COPY . /app

#expose port
EXPOSE 3000
# install dependencies and build app
CMD ["npm", "run", "start"]