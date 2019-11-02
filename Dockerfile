FROM python:3.8-alpine
LABEL maintainer="Julian Nonino <noninojulian@gmail.com>"

# Install required tools
RUN pip install --upgrade pip && \
    pip install terraform-compliance
