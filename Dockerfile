FROM ubuntu:22.04

RUN apt update && \
    apt upgrade -y && \
    apt install -y \
        python3-pip \
        python3-pytest \
        python3-setuptools \
        git \
        vim

# You could load up and install every package known to mankind but then
# you would have Anaconda. I try to keep it pared down to the ones that
# I find most useful most of the time.
RUN pip3 install -U \
         click \
         numpy \
         Matplotlib \
         PyQt6

# Create a bashrc file somewhere that the user can conveniently source it
# but also where it doesn't interfere with the user's real .bashrc
COPY bashrc /usr/local/home/

# Override the default TERM type which is xterm. Without this, you won't get 
# a color prompt and using the arrow keys to go through the command history
# will seriously hose the command-line. This might break something so keep an 
# eye on terminal behavior until this is proven solid.
ENV TERM=screen-256color

CMD ["/bin/bash"]
