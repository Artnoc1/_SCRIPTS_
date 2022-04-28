From Stack Overflow ( https://stackoverflow.com )
  https://stackoverflow.com/questions/25864385/changing-android-device-orientation-with-adb
  https://stackoverflow.com/a/25864485

--bind value:i:0
0-> portrait
1-> landscape
2,3 -> reverse port and land

portrait:
    adb shell content insert --uri content://settings/system --bind name:s:accelerometer_rotation --bind value:i:0

landscape:
    adb shell content insert --uri content://settings/system --bind name:s:user_rotation --bind value:i:1

