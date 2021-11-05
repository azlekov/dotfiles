alias gradleclean="rm -rf $HOME/.gradle/caches/"
alias adbota="adb kill-server && adb tcpip 5555 && sleep 5 && adb shell ip route | awk '{print $9}' | xargs adb connect"