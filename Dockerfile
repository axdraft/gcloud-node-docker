FROM google/cloud-sdk

# Install nodejs, wget, make, ruby, ruby-dev, sass v.3.4.22, compass
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get update && apt-get install -y  \
        nodejs \
        wget \
        make \
        ruby \
        ruby-dev  && \
        gem install --no-rdoc --no-ri sass:3.4.22 \
        compass \
    && apt-get -qyy autoremove \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -qyy clean
