# Save the original login path
export LOGINPATH=$PATH

# User scripts might be in various locations
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/code:$PATH"
export PATH="$HOME/scripts:$PATH"
export PATH="$HOME/code/bin:$PATH"

# If using MacPorts, you'll need the /opt/local paths
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
