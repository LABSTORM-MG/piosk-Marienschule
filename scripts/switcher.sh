#!/bin/bash

# Anzahl der URLs auslesen
URLS=$(jq -r '.urls | length' /opt/piosk/config.json)

# Tabs wechseln und alle 10 Durchläufe aktualisieren
for ((TURN=1; TURN<=$((10*URLS)); TURN++)); do
  # Tab wechseln (Strg + Tab)
  xdotool key ctrl+Tab
  
  # In den letzten Runden aktualisieren (Strg + R)
  if [ $TURN -gt $((9*URLS)) ]; then
    xdotool key ctrl+r
    
    if [ $TURN -eq $((10*URLS)) ]; then
      (( TURN=0 ))  # Zurücksetzen auf 0, Schleife beginnt von vorne
    fi
  fi
  
  # Alle 10s zum nächsten Tab
  sleep 10
done
