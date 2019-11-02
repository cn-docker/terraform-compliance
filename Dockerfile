FROM python:3.8-alpine
LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

# Install required tools
RUN apk --update add git less openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/* && \
    pip install --upgrade pip

# Install Terraform Compliance
RUN pip install terraform-compliance
