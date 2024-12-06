# Use the nginx image as the base image
FROM nginx:alpine

# Copy index.html to the default nginx directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80
