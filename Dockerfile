# # Use an official Node.js runtime as a parent image
# FROM node:14-alpine

# # Set the working directory to /app
# WORKDIR /app

# # Copy the package.json file to the working directory
# COPY package.json ./

# # Check if yarn.lock exists and copy it, otherwise skip
# COPY yarn.lock* ./

# # Install dependencies
# RUN if [ -f yarn.lock ]; then yarn install --frozen-lockfile; else npm install; fi

# # Copy the entire app directory to the working directory
# COPY . .

# # Verbose logging for build commands
# RUN echo "Building iOS bundle..." && npx react-native bundle --platform ios --dev false --entry-file index.js --bundle-output ios/main.jsbundle --assets-dest ios/assets && echo "iOS bundle built successfully."
# RUN echo "Building Android bundle..." && npx react-native bundle --platform android --dev false --entry-file index.js --bundle-output android/app/src/main/assets/index.android.bundle --assets-dest android/app/src/main/res && echo "Android bundle built successfully."

# # Expose port 8080 for the React Native packager
# EXPOSE 8080

# # Start the app
# CMD ["npx", "react-native", "start"]


# Use a specific Node version as a base image
FROM node:16

# Set the working directory inside the container
WORKDIR /SpotDiary/SpotDiary

# Copy all project files into the container
COPY . .

# Install project dependencies
RUN npm install
# Or if you are using yarn
# RUN yarn install

# Expose port 8081 for development
EXPOSE 8081

# Suppress deprecation warnings and start the app
CMD ["sh", "-c", "NODE_NO_WARNINGS=1 npx react-native start"]

