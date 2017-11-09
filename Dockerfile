FROM google/cloud-sdk

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get update && apt-get install -y  \
        nodejs \
        make \
        ruby \
        ruby-dev  && \
        gem install --no-rdoc --no-ri sass:3.4.22 \
        compass && \
        node -v