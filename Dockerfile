FROM docker:latest
RUN \
    apk -Uuv add \ 
    bash \
    curl \
    less \
    git  \
    groff \
    jq \
    python \
    py-pip \
    py2-pip \
    iptables && \
    pip install --upgrade pip awscli s3cmd && \
    apk --purge -v del py-pip py2-pip && \
    rm /var/cache/apk/*
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.14.0/bin/linux/amd64/kubectl && chmod +x kubectl && mv kubectl /usr/local/bin
