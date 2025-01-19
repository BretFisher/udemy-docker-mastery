#!/bin/bash

# A sample startup script that incorrectly starts a long-running process as a sub-process
#  of this shell.

# Do some startup things like check permissions or environment variables
echo "Starting up..."
echo "Notice the PID of the webserver should be 1, but because it is a sub-process of this shell, it is not."
chmod +x startup.sh

# BAD: Start a long-running process (which will give it a new PID, and the shell will NOT exit)
# This can create shutdown issues with Linux Signals and potentally zombie processes
./webserver

# BETTER: It would be better to pass execution to the long-running process and shut down this shell
# exec ./webserver

# BEST: The best way is to put this script in the Dockerfile ENTRYPOINT ["./startup.sh"]
# Next, add CMD ["./webserver"] to the Dockerfile
# Then, add this string as the last line in this script `exec "$@"`
# which, in effect, will pass execution from ENTRYPOINT to CMD strings
