FROM google/cloud-sdk

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y  \
        nodejs \
        yarn \
        wget \
    && apt-get -qyy autoremove \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -qyy clean

# Install awscli
RUN apt-get update && apt-get install -y python3-pip &&  pip3 install awscli

# Install docker
RUN apt-get install docker-ce docker-ce-cli containerd.io

# Install Google Chrome to run integration tests
RUN \
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
  apt-get update && \
  apt-get install -y google-chrome-stable && \
  rm -rf /var/lib/apt/lists/*
