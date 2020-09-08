FROM nervesproject/nerves_system_br:1.12.2

LABEL "com.github.actions.name"="Build System"
LABEL "com.github.actions.description"="Build Nerves System"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="blue"

LABEL "repositoty"="https://github.com/bcdevices/ly10-system-rpi3"
LABEL "homepage"="https://github.com/bcdevices/ly10-system-rpi3"
LABEL "maintainer"="Blue Clover Devices"

ENV ELIXIR_VERSION=1.10.4-otp-23

RUN apt-get -y install -y \
      gcc-multilib \
      g++-multilib

#Install Elixir
RUN wget https://repo.hex.pm/builds/elixir/v$ELIXIR_VERSION.zip && \
      unzip -d /usr/local/elixir v$ELIXIR_VERSION.zip

ENV PATH /usr/local/elixir/bin:$PATH

#Create Work Directory
RUN mkdir -p /nerves-system

#Set Working Directory
WORKDIR /nerves-system

# COPY
COPY . /nerves-system
