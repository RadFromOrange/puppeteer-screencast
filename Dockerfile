FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
COPY dist/yourscript /app/yourscript
RUN apt-get update && apt-get install -y \
    procps \
    libfile-readbackwards-perl \
    curl \
    x11-xkb-utils \
    xkb-data \
    net-tools \
    python3 \
    libxmu6 \
    fluxbox \
    libglib2.0-0 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libasound2 \
    libxss1 \
    libnss3 \
    libnspr4 \
    libdbus-1-3 \
    libexpat1 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxtst6 \
    libappindicator3-1 \
    libindicator3-7 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libcairo2 \
    libgbm1 \
    fonts-noto-color-emoji \
    fonts-liberation \
    xdg-utils \
    ttf-ubuntu-font-family \
    --no-install-recommends

# Create a non-root user with UID 1000
RUN useradd -u 1000 -m myuser
RUN mkdir /.vnc 
RUN chmod 755  /app/yourscript 
USER 1000
EXPOSE 6080
# ENTRYPOINT ["sh"]
ENTRYPOINT ["/app/yourscript","--start"]