# Motorola Edge 2024 Unofficial Recoveries/Firmware

This project couldn't have been possible if it wasn't for alot of resources. I will try to link them all, but forgive me if I don't.

### Recoveries 

Options at the moment of writing are, TWRP, PBRP, OrangeFox.

*Flashing* 

Download the recovery you want. Once downloaded, on your phone, open settings, go to About phone -> Device identifiers  -> Tap build number until you get the toast notif that you are now a developer.

Go back to the normal settings, and click settings then developer settings and enable USB Debugging.

Once enabled, plug your phone into your computer and download ADB (Android Debug Bridge) and reboot the phone into the bootloader by running the command "adb reboot bootloader"

Once you see the Android with a open panel, run the command; "fastboot flash recovery [img file name]" (Make sure your terminal is in the directory your recovery image is in!)

Once flashed, run fastboot reboot recovery.

Should work, if not, post a GitHub issue.

### Firmware

Currently I have not built any firmware images but if you want to request one, please setup a issue telling me which ROM you would like me to build. I should mention that I may not build every ROM, but I will try to do the ones that are popular.

### Building yourself 

I'm too lazy to explain, but if someone wants to write a pull request that explains the entire process for me, please do.

# Credits

BobTheBlinker
twrpdtgen
Van Firmware Dumps
The random Indian people I watched on YouTube
