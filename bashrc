# bashrc stuff specific to this container

# My real .bashrc goes to great lengths to set up the prompt based on a 
# variety of factors. One thing it always does is include user@hostname.
# In a container we will extend that to user@hostname-container. We'll
# also change the color of that portion
PS1=`echo "$PS1" | sed -e s/32m/36m/ -e s/@/@\${REAL_HOST}\|/`

# Aliases
alias python=python3
alias pytest=pytest-3


# Add the following lines to your host's bashrc and uncomment them

# By convention, I place a container-specific bashrc in /usr/local/home.
# If that file exists, source it. This file will never exist on the host.
# if [ -f /usr/local/home/bashrc ]; then
#    . /usr/local/home/bashrc
# fi
