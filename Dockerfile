# Dockerizing MongoDB: Dockerfile for building MongoDB images
# Based on ubuntu:20.04 , mongoDB 5.0.22

FROM       ubuntu:20.04
MAINTAINER Docker - Konstantin Manchev
# Installation:
# Update apt-get sources AND install curl ( to fix /mongod: error while loading shared libraries: libcurl.so.4: cannot open shared object file: No such file or directory )
RUN apt update -y && apt install -y curl 
RUN mkdir -p /work/mongodb/bin
RUN mkdir -p /work/mongodb/cfg
RUN mkdir -p /work/mongodb/data
ADD  https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-ubuntu2004-5.0.22.tgz /work/mongodb/
RUN tar -zxvf /work/mongodb/mongodb-linux-x86_64-ubuntu2004-5.0.22.tgz -C /work/mongodb/bin  --strip-components=2
# Expose port #27017 from the container to the host
EXPOSE 27017
# Set /usr/bin/mongod as the dockerized entry-point application
## ENTRYPOINT ["/work/mongodb/bin/mongod"]
## CMD [ "/lib/systemd/systemd" ]
CMD ["sleep", "5000"]
###
### kiko@titan-lab:/work/docker$ docker build -t umbelia .
### docker tag umbelia kiko075/img:umbelia
### docker push docker.io/kiko075/img:umbelia
### docker pull kiko075/img:umbelia
