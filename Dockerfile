FROM google/cloud-sdk

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get update && apt-get install -y  \
        nodejs \
        wget \
    && apt-get -qyy autoremove \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -qyy clean
    
# Update npm to the latest version
RUN npm i -g npm
    
# Install Google Chrome to run integration tests
RUN wget -O /chrome.deb 'https://www.slimjet.com/chrome/download-chrome.php?file=lnx%2Fchrome64_63.0.3239.108.deb' && \
    apt-get update && apt-get install -y  \
        fonts-liberation \
        gconf-service \
        libappindicator1 \
        libgconf-2-4 \
        libgtk-3-0 \
        libxss1 \
        xdg-utils \
   && dpkg -i /chrome.deb \
   && rm /chrome.deb
