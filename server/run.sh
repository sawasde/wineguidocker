#!/bin/bash

# Local variables
vo="-viewonly"

# Create the password file
mkdir "$HOME"/.vnc
echo "$VNCPASSWD" | vncpasswd -f > "$HOME"/.vnc/passwd
chown -R "$USER:$GROUP" "$HOME"/.vnc
chmod 0600 "$HOME"/.vnc/passwd

# IF we want a view-only vnc-server
if [ "$VIEWONLY" = false ] ; then vo="-economictranslate" ; fi

# Start the vnc server with the environment variables
vncserver -depth "$DEPTH" -geometry "$GEOMETRY" "$DISPLAY" "$vo" -localhost 

# Save the magic cookies in the shared volume
xauth list > /mcookie/cookies.txt

# Live log
tail -F "$HOME"/.vnc/*.log