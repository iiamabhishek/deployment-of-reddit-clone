# Use a smaller, more efficient Node.js base image
FROM node:19-alpine

# Set the working directory
WORKDIR /reddit-clone

# Copy only package.json and package-lock.json for dependency installation
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Expose the application port
EXPOSE 3000

# Use a default non-root user for better security
USER node

# Start the application
CMD ["npm", "run", "dev"]
