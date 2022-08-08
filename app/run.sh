#!/bin/bash

# Wait the cookie connections
sleep 3

# Add the magic cookies from the xserver
while read cookie; do
  # shellcheck disable=SC2086
  xauth add $cookie
done < /mcookie/cookies.txt

# Start MetaTrader
wine explorer /desktop=L4D2,1366x768 "bin/$EXECUTABLE"
#wine explorer /desktop=L4D2,"$GEOMETRY" "npp.7.8.bin/$EXECUTABLE"
# wine explorer /desktop=L4D2,1366x768 "npp.7.8.bin/notepad++.exe"