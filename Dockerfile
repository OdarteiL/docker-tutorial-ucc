# Use nginx on Alpine Linux as the base image.
# Alpine is a minimal Linux distro (~5MB), keeping our image small and fast.
FROM nginx:alpine

# Copy our source files into nginx's default serving directory.
COPY src/ /usr/share/nginx/html/

# Document that this container listens on port 80 at runtime.
# This doesn't actually publish the port — you still need -p when running.
EXPOSE 80
