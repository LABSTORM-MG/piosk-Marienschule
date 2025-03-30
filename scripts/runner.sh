#!/bin/bash
xset s off        # Disable screen saver
xset -dpms        # Disable DPMS (Energy Star) features
xset s noblank    # Don't blank the video device

chromium-browser \
  $(jq -r '.urls | map(.url) | join(" ")' /opt/piosk/config.json) \
  --disable-component-update \
  --disable-composited-antialiasing \
  --disable-gpu-driver-bug-workarounds \
  --disable-infobars \
  --disable-low-res-tiling \
  --disable-pinch \
  --disable-session-crashed-bubble \
  --disable-smooth-scrolling \
  --enable-accelerated-video-decode \
  --enable-gpu-rasterization \
  --enable-low-end-device-mode \
  --enable-oop-rasterization \
  --force-device-scale-factor=1 \
  --ignore-gpu-blocklist \
  --kiosk \
  --no-first-run \
  --noerrdialogs \
  --no-default-browser-check \
  --disable-translate \
  --disable-features=TranslateUI,AutofillServerCommunication,PasswordManagerUI \
  --user-data-dir=/tmp/chrome-profile

