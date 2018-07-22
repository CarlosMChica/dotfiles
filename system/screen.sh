#!/usr/bin/env bash

screenHomeLayout() {
  xrandr --output DP2 --mode 1920x1080 --pos 0x0 --rotate normal \
         --output DP1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal \
         --output HDMI2 --mode 1600x1200 --pos 3840x0 --rotate left \
         --output HDMI1 --off \
         --output VIRTUAL1 --off \
         --output DP3 --off
  variety --next
  soundMonitorOutput
}

screenHomeWithTvLayout() {
  xrandr --output DP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal \
         --output DP2 --mode 1360x768 --pos 3120x0 --rotate normal \
         --output HDMI2 --mode 1600x1200 --pos 1920x0 --rotate left
  variety --next
  soundTvOutput
}

screenMacbookLayout() {
  xrandr --output eDP1 --primary --mode 2560x1600 --pos 0x0 --rotate normal \
    --output VIRTUAL1 --off \
    --output DP1 --off \
    --output HDMI2 --off \
    --output HDMI1 --off \
    --output DP2 --off
}

screenMacbookRightLayout() {
  xrandr --output eDP1 --mode 2560x1600 --pos 2560x0 --rotate normal \
         --output DP2 --primary --mode 2560x1440 --pos 0x80 --rotate normal
  variety --next
}

screenMacbookLeftLayout() {
  xrandr --output VIRTUAL1 --off \
    --output eDP1 --mode 2560x1600 --pos 0x0 --rotate normal \
    --output DP2 --primary --mode 2560x1440 --pos 2560x96 --rotate normal \
    --output DP1 --off \
    --output HDMI2 --off \
    --output HDMI1 --off
  variety --next
}
