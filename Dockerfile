FROM jenkins/jenkins:lts

USER root

ENV MAVEN_VERSION 3.3.9

#Install Maven
RUN curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn && \
  rm -rf /var/lib/apt/lists/*

# Define commonly used JAVA_HOME variable and MAVEN
ENV MAVEN_HOME /usr/share/maven

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN apt-get update
RUN apt-get install dos2unix
RUN dos2unix /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt