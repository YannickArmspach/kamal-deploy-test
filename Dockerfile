# Use the official Node.js base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

RUN apk update && apk upgrade

# Copy dependency definitions
COPY ./package*.json /app/

# Install dependencies
RUN npm install && npm cache clean --force

# Copy source code
COPY . .

# Build the project
RUN npm run build

# Expose port 3000
EXPOSE 3000

# Start the application
CMD ["npm", "start"]