# Image
FROM node:20-alpine

# RUN apk add g++ make python3

# Set up work directory
WORKDIR /var/www/app

# Configure host
ENV HOST 0.0.0.0

# Init command
CMD ["sh", "-c", "npm install && npm run dev"]
