FROM datadog/docker-dd-agent

# install java for JMX logging
ENV JAVA_VERSION 8u25
ENV JAVA_FOLDER_NAME jdk1.8.0_25
RUN apt-get update -qq && \
  apt-get install -y wget gzip curl && \
  cd /tmp && wget  --no-cookies --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com; oraclelicense=accept-securebackup-cookie; s_nr=1394181036342;" http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}-b17/jdk-${JAVA_VERSION}-linux-x64.tar.gz && \
  gzip -d jdk-${JAVA_VERSION}-linux-x64.tar.gz && \
  tar -xf jdk-8u25-linux-x64.tar && \
  mkdir -p /opt/Oracle_Java && \
  mv /tmp/${JAVA_FOLDER_NAME}  /opt/Oracle_Java/${JAVA_FOLDER_NAME} && \
  update-alternatives --install "/usr/bin/java" "java" "/opt/Oracle_Java/${JAVA_FOLDER_NAME}/bin/java" 1 && \
  update-alternatives --install "/usr/bin/javac" "javac" "/opt/Oracle_Java/${JAVA_FOLDER_NAME}/bin/javac" 1 && \
  update-alternatives --install "/usr/bin/javaws" "javaws" "/opt/Oracle_Java/${JAVA_FOLDER_NAME}/bin/javaws" 1 && \
  update-alternatives --install "/usr/bin/jar" "jar" "/opt/Oracle_Java/${JAVA_FOLDER_NAME}/bin/jar" 1 && \
  update-alternatives --set "java" "/opt/Oracle_Java/${JAVA_FOLDER_NAME}/bin/java" && \
  update-alternatives --set "javac" "/opt/Oracle_Java/${JAVA_FOLDER_NAME}/bin/javac" && \
  update-alternatives --set "javaws" "/opt/Oracle_Java/${JAVA_FOLDER_NAME}/bin/javaws" && \
  update-alternatives --set "jar" "/opt/Oracle_Java/${JAVA_FOLDER_NAME}/bin/jar" && \
  rm -rf /tmp/jdk-8u25-linux-x64.tar

# install confd
RUN curl -L https://github.com/kelseyhightower/confd/releases/download/v0.9.0/confd-0.9.0-linux-amd64 -o /usr/local/bin/confd && \
  chmod +x /usr/local/bin/confd

COPY reload.sh /reload.sh
RUN chmod +x /reload.sh

COPY start.sh /start.sh
RUN chmod +x /start.sh

COPY checks.d/ /etc/dd-agent/checks.d/
COPY confd/ /etc/confd/

CMD ["/start.sh"]
