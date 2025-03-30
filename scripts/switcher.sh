#!/bin/bash

# Anzahl der URLs auslesen
URLS=$(jq -r '.urls | length' /opt/piosk/config.json)

# Tabs wechseln und alle 3 Durchläufe aktualisieren
for ((TURN=1; TURN<=$((3*URLS)); TURN++)); do
  # Tab wechseln (Strg + Tab)
  xdotool key ctrl+Tab
  
  # In den letzten Runden aktualisieren (Strg + R)
  if [ $TURN -gt $((2*URLS)) ]; then
    xdotool key ctrl+r
    
    if [ $TURN -eq $((3*URLS)) ]; then
      (( TURN=0 ))  # Zurücksetzen auf 0, Schleife beginnt von vorne
    fi
  fi
  
  # Alle 30s zum nächsten Tab
  sleep 30
done
