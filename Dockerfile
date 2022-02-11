FROM hashicorp/terraform:1.1.5 as tf

FROM python:3.10.2-alpine
LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

# Install required tools
RUN apk --update add git make less openssh openssl-dev g++ gcc libxslt libxslt-dev libc-dev libxml2 libxml2-dev python-dev libffi-dev && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/* && \
    pip install --upgrade pip

# Copy Terraform Binary
COPY --from=tf /bin/terraform /bin/terraform

# Install Terraform Compliance
RUN pip install terraform-compliance==1.3.31
