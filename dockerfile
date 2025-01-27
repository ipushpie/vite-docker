# Use Node.js 20 as the base image
FROM node:20-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package files and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy the rest of the application source code
COPY . .

# Build the app for production
RUN npm run build

# Expose the port for the app (default Vite preview port is 4173)
EXPOSE 4173

# Command to run the app in preview mode
CMD ["npm", "run", "preview"]
