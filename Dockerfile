# Use official Nginx image as the base
FROM nginx:alpine

# Remove default Nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy your static HTML files to the Nginx directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx (this is default CMD for the nginx image, so it's optional)
CMD ["nginx", "-g", "daemon off;"]
