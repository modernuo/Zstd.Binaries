FROM ubuntu:16.04 as ubuntu-16
RUN apt-get update && apt-get install -y gcc make
COPY ./zstd-src ./zstd
WORKDIR /zstd
RUN make

FROM ubuntu:18.04 as ubuntu-18
RUN apt-get update && apt-get install -y gcc make
COPY ./zstd-src ./zstd
WORKDIR /zstd
RUN make

FROM ubuntu:20.04 as ubuntu-20
RUN apt-get update && apt-get install -y gcc make
COPY ./zstd-src ./zstd
WORKDIR /zstd
RUN make

FROM debian:9 as debian-9
RUN apt-get update && apt-get install -y gcc make
COPY ./zstd-src ./zstd
WORKDIR /zstd
RUN make

FROM debian:10 as debian-10
RUN apt-get update && apt-get install -y gcc make
COPY ./zstd-src ./zstd
WORKDIR /zstd
RUN make

FROM centos:7 as centos-7
RUN yum update -y && yum install -y gcc make
COPY ./zstd-src ./zstd
WORKDIR /zstd
RUN make

FROM centos:8 as centos-8
RUN yum update -y && yum install -y gcc make
COPY ./zstd-src ./zstd
WORKDIR /zstd
RUN make

FROM fedora:32 as fedora-32
RUN dnf upgrade -y && dnf install -y gcc make
COPY ./zstd-src ./zstd
WORKDIR /zstd
RUN make

FROM fedora:33 as fedora-33
RUN dnf upgrade -y && dnf install -y gcc make
COPY ./zstd-src ./zstd
WORKDIR /zstd
RUN make

FROM fedora:34 as fedora-34
RUN dnf upgrade -y && dnf install -y gcc make
COPY ./zstd-src ./zstd
WORKDIR /zstd
RUN make

FROM alpine:latest
RUN mkdir -p ./runtimes/ubuntu.16.04-x64/native
RUN mkdir -p ./runtimes/ubuntu.18.04-x64/native
RUN mkdir -p ./runtimes/ubuntu.20.04-x64/native

RUN mkdir -p ./runtimes/debian.9-x64/native
RUN mkdir -p ./runtimes/debian.10-x64/native

RUN mkdir -p ./runtimes/centos.7-x64/native
RUN mkdir -p ./runtimes/centos.8-x64/native

RUN mkdir -p ./runtimes/fedora.32-x64/native
RUN mkdir -p ./runtimes/fedora.33-x64/native
RUN mkdir -p ./runtimes/fedora.34-x64/native

# COPY --from=ubuntu-16 /zstd/lib/libzstd.so.1 ./runtimes/ubuntu.16.04-x64/native/libzstd.so
# COPY --from=ubuntu-18 /zstd/lib/libzstd.so.1 ./runtimes/ubuntu.18.04-x64/native/libzstd.so
# COPY --from=ubuntu-20 /zstd/lib/libzstd.so.1 ./runtimes/ubuntu.20.04-x64/native/libzstd.so
#
# COPY --from=debian-9 /zstd/lib/libzstd.so.1 ./runtimes/debian.9-x64/native/libzstd.so
# COPY --from=debian-10 /zstd/lib/libzstd.so.1 ./runtimes/debian.10-x64/native/libzstd.so
#
# COPY --from=centos-7 /zstd/lib/libzstd.so.1 ./runtimes/centos.7-x64/native/libzstd.so
# COPY --from=centos-8 /zstd/lib/libzstd.so.1 ./runtimes/centos.8-x64/native/libzstd.so
#
# COPY --from=fedora-32 /zstd/lib/libzstd.so.1 ./runtimes/fedora.32-x64/native/libzstd.so
# COPY --from=fedora-33 /zstd/lib/libzstd.so.1 ./runtimes/fedora.33-x64/native/libzstd.so
# COPY --from=fedora-33 /zstd/lib/libzstd.so.1 ./runtimes/fedora.34-x64/native/libzstd.so

COPY --from=ubuntu-16 /zstd/zstd ./runtimes/ubuntu.16.04-x64/native/zstd
COPY --from=ubuntu-18 /zstd/zstd ./runtimes/ubuntu.18.04-x64/native/zstd
COPY --from=ubuntu-20 /zstd/zstd ./runtimes/ubuntu.20.04-x64/native/zstd

COPY --from=debian-9 /zstd/zstd ./runtimes/debian.9-x64/native/zstd
COPY --from=debian-10 /zstd/zstd ./runtimes/debian.10-x64/native/zstd

COPY --from=centos-7 /zstd/zstd ./runtimes/centos.7-x64/native/zstd
COPY --from=centos-8 /zstd/zstd ./runtimes/centos.8-x64/native/zstd

COPY --from=fedora-32 /zstd/zstd ./runtimes/fedora.32-x64/native/zstd
COPY --from=fedora-33 /zstd/zstd ./runtimes/fedora.33-x64/native/zstd
COPY --from=fedora-33 /zstd/zstd ./runtimes/fedora.34-x64/native/zstd
