FROM alpine:latest

ENV TZ=US \
    DEBIAN_FRONTEND=noninteractive

RUN apk update && \
apk upgrade && \
apk add \
    git \
    vim \
    bash \
    py3-click \
    py3-numpy \
    py3-matplotlib \
    py3-pytest \
    py3-setuptools \
    py3-qt6

# Create a bashrc file somewhere that the user can conveniently source it
# but also where it doesn't interfere with the user's real .bashrc
COPY bashrc /usr/local/home/

# Override the default TERM type which is xterm. This might break something
# so keep an eye on terminal behavior until this is proven solid.
ENV TERM=screen-256color

CMD ["/bin/bash"]
