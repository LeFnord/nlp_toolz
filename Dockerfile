FROM flurdy/oracle-java6

MAINTAINER LeFnord <pscholz.le@gmail.com>

# java install parts are taken from https://github.com/flurdy/Dockerfiles/blob/master/oracle-java6/Dockerfile
# MAINTAINER https://github.com/flurdy

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list \
    && apt-get install -y libssl-dev libreadline-dev zlib1g-dev \
    && apt-get install -y byobu bzip2 curl git htop man unzip vim wget gcc make \
    && rm -rf /var/lib/apt/lists/*

# java foo
#
# accept-java-license
RUN echo /usr/bin/debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

RUN apt-get install -yq oracle-java6-installer oracle-java6-set-default && \
  apt-get autoremove -yq && \
  apt-get clean -yq && \
  rm -rf /var/lib/apt/lists/*

ENV JAVA_PACKAGE=jre
ENV JAVA_HOME=/usr/lib/jvm/java-6-oracle/
ENV PATH=${PATH}:${JAVA_HOME}/bin/
ENV LANG=C.UTF-8

# ruby foo
RUN git clone git://github.com/rbenv/rbenv.git /usr/local/rbenv \
  &&  git clone git://github.com/rbenv/ruby-build.git /usr/local/rbenv/plugins/ruby-build \
  &&  git clone git://github.com/jf/rbenv-gemset.git /usr/local/rbenv/plugins/rbenv-gemset \
  &&  /usr/local/rbenv/plugins/ruby-build/install.sh

ENV PATH /usr/local/rbenv/bin:$PATH
ENV RBENV_ROOT /usr/local/rbenv

RUN echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh \
  &&  echo 'export PATH=/usr/local/rbenv/bin:$PATH' >> /etc/profile.d/rbenv.sh \
  &&  echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh

RUN echo 'export RBENV_ROOT=/usr/local/rbenv' >> /root/.bashrc \
  &&  echo 'export PATH=/usr/local/rbenv/bin:$PATH' >> /root/.bashrc \
  &&  echo 'eval "$(rbenv init -)"' >> /root/.bashrc \
  &&  echo 'gem: --no-rdoc --no-ri"' >> /root/.gemrc

ENV PATH /usr/local/rbenv/bin:/usr/local/rbenv/shims:$PATH

RUN eval "$(rbenv init -)"; rbenv install 2.4.3 \
  &&  eval "$(rbenv init -)"; rbenv global 2.4.3 \
  &&  eval "$(rbenv init -)"; gem install bundler -f

ADD . /root/app
WORKDIR /root/app

RUN wget -P . 'https://dl.dropboxusercontent.com/sh/1layyjgf5h0wwi3/AACw8Y04KnFotOpBkzcfLxmwa/jars.zip'
RUN unzip jars.zip

RUN wget -P . 'https://dl.dropboxusercontent.com/sh/1layyjgf5h0wwi3/AADUSMRMVg3n54Djdy9BWYVEa/models.zip'
RUN unzip models.zip

RUN eval "$(rbenv init -)"; bundle install

CMD ["/bin/bash"]
