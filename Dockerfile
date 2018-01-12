FROM google/cloud-sdk

# Install nodejs, wget, make, ruby, ruby-dev, sass v.3.4.22, compass
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get update && apt-get install -y  \
        nodejs \
        wget \
        make \
        default-jre \
        ruby \
        ruby-dev  && \
        gem install --no-rdoc --no-ri sass:3.4.22 \
        compass \
    && apt-get -qyy autoremove \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -qyy clean
    
# Install Chromium.
RUN \
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
  apt-get update && \
  apt-get install -y google-chrome-stable && \
  rm -rf /var/lib/apt/lists/*
