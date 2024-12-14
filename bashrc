# bashrc stuff specific to this container

# Aliases
alias python=python3
alias pytest=pytest-3


# Add the following lines to your host's bashrc and uncomment them

# By convention, I place a container-specific bashrc in /usr/local/home.
# If that file exists, source it. This file will never exist on the host.
# if [ -f /usr/local/home/bashrc ]; then
#    . /usr/local/home/bashrc
# fi
