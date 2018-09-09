#!/usr/bin/env bash

screenHomeLayout() {
  xrandr --output DP2 --primary --mode 1920x1080 --pos 0x0 --rotate normal \
         --output DP1 --off \
         --output HDMI2 --mode 1600x1200 --pos 3840x0 --rotate left \
         --output HDMI1 --off \
         --output VIRTUAL1 --off \
         --output DP3 --off
  variety --next
  soundMonitorOutput
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

screenLenovoX230Layout() {
  xrandr --output LVDS1 --mode 1366x768 --pos 2560x312 --rotate normal --primary\
         --output VGA1 --off \
         --output eDP1 --off \
         --output VIRTUAL1 --off \
         --output DP1 --off \
         --output HDMI2 --off \
         --output HDMI1 --off \
         --output DP2 --off
  variety --next
}

screenLenovoX230RightLayout() {
  xrandr --output DP1 --primary --mode 2560x1440 --pos 0x0 --rotate normal \
         --output LVDS1 --mode 1366x768 --pos 2560x312 --rotate normal --output VGA1 --off \
         --output VIRTUAL1 --off \
         --output DP3 --off \
         --output DP2 --off \
         --output HDMI3 --off \
         --output HDMI2 --off \
         --output HDMI1 --off \
  variety --next
}

screenLenovoX230LeftLayout() {
  xrandr --output DP1 --primary --mode 2560x1440 --pos 1366x0 --rotate normal \
         --output LVDS1 --mode 1366x768 --pos 0x376 --rotate normal \
         --output DP3 --off \
         --output DP2 --off \
         --output HDMI3 --off \
         --output HDMI2 --off \
         --output VIRTUAL1 --off \
         --output HDMI1 --off \
         --output VGA1 --off
  variety --next
}
