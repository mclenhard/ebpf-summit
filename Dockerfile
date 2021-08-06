FROM ubuntu:20.04 as build
ENV  DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
apt install -y bison python3-pip build-essential cmake flex git libedit-dev  \
libllvm7 llvm-7-dev libclang-7-dev python zlib1g-dev libelf-dev libfl-dev bpfcc-tools


RUN git clone https://github.com/iovisor/bcc.git
RUN mkdir bcc/build
WORKDIR  bcc/build
RUN cmake ..
RUN make
RUN  make install
RUN cmake -DPYTHON_CMD=python3 .. # build python3 binding

WORKDIR /usr/sbin/


COPY main.py .
CMD [ "python3", "./main.py" ]