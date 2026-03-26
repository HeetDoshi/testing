# Use the lightweight Nginx Alpine image
FROM nginx:alpine

# Copy your HTML files to the Nginx default public directory
COPY . /usr/share/nginx/html/

# Expose port 80
EXPOSE 80
