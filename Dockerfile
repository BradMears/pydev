FROM ubuntu:22.04

ENV TZ=US \
    DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt upgrade -y && \
    apt install -y \
        python3-pip \
        python3-pytest \
        python3-setuptools \
        git

# This variable won't take effect until pip 22.1 and Ubuntu 22.04 isn't 
# there yet but I'll put this in and start using it in my Dockerfiles so
# once the distro version of pip does get to that version, it will work.
# ("work" means "suppress messages about running pip as root")
ENV PIP_ROOT_USER_ACTION=ignore

# You could load up and install every package known to mankind but then
# you would have Anaconda. I try to keep it pared down to the ones that
# I find most useful most of the time.
RUN pip3 install -U \
         click \
         numpy \
         Matplotlib \
         PyQt6

# Create an aliases file somewhere that the user can conveniently source it
# but also where it doesn't interfere with the user's real .bashrc
COPY bash_aliases /usr/local/home/

# Override the default TERM type which is xterm. This might break something
# so keep an eye on terminal behavior until this is proven solid.
ENV TERM=screen-256color

CMD ["/bin/bash"]
