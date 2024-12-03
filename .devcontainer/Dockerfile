# Use a lightweight base image with texlive
FROM debian:bullseye-slim

# Update and install necessary tools
RUN apt-get update --fix-missing && \
    apt-get install -y \
        texlive-full \
        git
