FROM ubuntu:xenial

# system upgrade
RUN apt-get update -y
RUN apt-get upgrade -y

# install JRE
RUN apt-get install default-jre -y

# install sbt
RUN apt-get install apt-transport-https -y
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
RUN apt-get update -y
RUN apt-get install sbt -y

# jump start download of sbt 0.13.6
RUN sbt -sbt-version 0.13.6 -version

# install aws command line tool
RUN apt-get install python python-pip -y
RUN pip install awscli --upgrade
