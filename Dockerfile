FROM hashicorp/terraform as tf

FROM python:3.8-alpine
LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

# Install required tools
RUN apk --update add git make less openssh g++ gcc libxslt libxslt-dev libc-dev libxml2 && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/* && \
    pip install --upgrade pip

# Copy Terraform Binary
COPY --from=tf /bin/terraform /bin/terraform

# Install Terraform Compliance
RUN pip install terraform-compliance
