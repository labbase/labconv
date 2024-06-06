# Use the Nginx image from Docker Hub
FROM nginx:stable-alpine

USER root

# Remove the default Nginx configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copy a configuration file from the current directory
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY ./index.html /usr/share/nginx/html

# Copy the SSL certificate and key
COPY localhost.crt /etc/nginx/certs/localhost.crt
COPY localhost.key /etc/nginx/certs/localhost.key

# Expose ports
EXPOSE 80 443

# Start Nginx when the container has provisioned
CMD ["nginx", "-g", "daemon off;"]