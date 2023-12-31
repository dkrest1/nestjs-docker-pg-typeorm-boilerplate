# Use the official Node.js image as the base image
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json into the working directory
COPY package*.json ./

# Install the application dependencies
RUN npm install 

# Install nest globally
RUN npm install -g @nestjs/cli

# Copy the application source code into the working directory
COPY . .

# Expose the application port (default is 3000 for NestJS)
EXPOSE ${APP_PORT}

# Start the application
CMD ["npm", "run", "start:dev"]