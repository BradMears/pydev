# bashrc stuff specific to this container

# My real .bashrc goes to great lengths to set up a fancy prompt, which
# includes the hostname. In a container, I want that hostname field to
# show the container's hostname and the host's hostname. The variable
# REAL_HOST must be passed into the container when you run it.
if [ -z "${REAL_HOST}" ]; then
    REAL_HOST="unknown"
fi
PS1=`echo "$PS1" | sed -e s/\\h/\\h@\${REAL_HOST}/`

# Aliases
alias python=python3
alias pytest=pytest-3


# Add the following lines to your host's bashrc and uncomment them

# By convention, I place a container-specific bashrc in /usr/local/home.
# If that file exists, source it. This file will never exist on the host.
# if [ -f /usr/local/home/bashrc ]; then
#    . /usr/local/home/bashrc
# fi
