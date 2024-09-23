FROM ubuntu:22.04

ENV TZ=US \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
            python3-pip \
            python3-pytest \
            python3-setuptools

RUN pip3 install -U \
         click \
         numpy \
         Matplotlib \
         PyQt6

# Create an aliases file somewhere that the user can conveniently source it
# but also where it doesn't interfere with any of the user's real files
RUN mkdir /app && \
    touch /app/bash_aliases && \
    echo 'alias python=python3' >> /app/bash_aliases && \
    echo 'alias pytest=pytest-3' >> /app/bash_aliases

WORKDIR ${HOME}
CMD ["/bin/bash"]
