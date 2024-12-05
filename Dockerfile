FROM hashicorp/terraform:1.10.1 as tf

FROM python:3.13.1-alpine
LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

# Install required tools
RUN apk --update add git make less openssh openssl-dev g++ gcc libxslt libxslt-dev libc-dev libxml2 libxml2-dev libffi-dev rust rustup cargo && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/* && \
    pip install --upgrade pip

# Copy Terraform Binary
COPY --from=tf /bin/terraform /bin/terraform

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir --requirement requirements.txt
