
# Motorola Edge 2024 Unofficial Recoveries/Firmware/Documentation

This is a GitHub repo that attempts to document all information that I know of when it comes to the Motorola Edge 2024, (avatrn). I plan to add guides/firmware dumps to this repo to hopefully assist in official ROM's being built for this phone.

## Custom Images

### Recovery Images
 - Downloads are available in releases. If you don't know how to flash, there is a guide below. 
 - [x] TWRP
 - [x] PBRP
 - [x] OFRP
 - [ ] SHRP
 
### Firmware

Currently I have not built any firmware images but if you want to request one, please setup a issue telling me which ROM you would like me to build. I should mention that I may not build every ROM, but I will try to do the ones that are popular.

## Guides

### Flashing Recovery

 1. Download the recovery you want. Once downloaded, on your phone, open
    settings, go to About phone -> Device identifiers  -> Tap build
    number until you get the toast notif that you are now a developer.
 2. Go back to the normal settings, and click settings then developer
    settings and enable USB Debugging.
 3. Once enabled, plug your phone into your computer and download ADB
    (Android Debug Bridge) and reboot the phone into the bootloader by
    running the command `adb reboot bootloader`
 4. Once you see the Android with a open panel, run the command;
    `fastboot flash recovery [img file name]` **(Make sure your terminal is in the directory your recovery image is in!)**
 5. Once flashed, run `fastboot reboot recovery`.
    
    Should work, if not, **post a GitHub issue.**

### Flashing ROMs/GSI

The process for flashing a GSI is odd, to say the least. I recommend you wait for official builds of your ROM/a unofficial one from me, but regardless.

Note; Download the **stock firmware for your exact device**  from [here.](https://mirrors.lolinet.com/firmware/lenomola/2024/avatrn/official/) Extract it and keep it for later.

1. Follow the previous guide to install your custom recovery.
2. Reboot your device to the bootloader.
3. Enter the following command; `fastboot flash vbmeta vbmeta.img --disable-verity --disable-verification` *Use the stock firmware vbmeta that you downloaded!*
4. Once done, enter the following command as well. `fastboot delete-logical-partition product` *Do not worry, this will not delete anything important like user data.*
5. Reboot into recovery using `fastboot reboot recovery` or manually going into the bootloader and selecting recovery mode.
6. Flash your ROM/GSI to the **System** partition. 
> [!WARNING]
> **Please make sure you did not select System EXT or Super. You should have only selected System.**

7. If done correctly, you should have a sucessful flash message in your recovery. Once done, back out of the message, (don't reboot just yet.) and now go to Wipe, and wipe the Dalvik ART Cache. You should also entirely format your user data,  but if you don't want to, you can try without it. I always had to wipe it,  but maybe it may be different for you.

8. Reboot. If you get a bootloop, flash the stock firmware back by using [this GitHub script](https://github.com/dlenski/motoflash2sh) to convert the flashfile.xml to a shell script, reboot to the bootloader, and run it, and then retry. If it still doesn't work, the ROM you used doesn't support your device/you may need to redownload the file as it may be corrupted.

### OTA Update Fix

You may have noticed after rooting that when trying to update via the settings, you get "Package verification failed."  I'm unsure what causes this issue, but I'm sure it's due to the checksum failing. I have found 2 fixes to this, (partially.)

**Fix 1**

1. Using the flashing guide above, flash your stock firmware back and then update your phone in the stock ROM. Then once on the latest update, dump your boot image and patch it with Magisk/KernelSU/etc. (You'll have to look this one up, sorry.)

**Fix 2**

1. Flash your custom recovery, boot into it, and mount vendor.
2. Using the file manager, go into vendor, and click the build.prop file and then click View.
3. Find the following lines; `ro.mot.build.guid` and `ro.carrier` (ro.carrier may be "unknown", if so pull up the recovery terminal and input the command getprop and find ro.carrier there.) and write down/keep note of their output.
4. Go to the following site. https://motoota.lolinet.com/guid.php and input what the output of the lines above were in the according boxes.
5. Press "Get it", and now you should be able to download the OTA package for your device and sideload it. (I couldn't get past this step, you may have to edit the actual OTA package in order to get it to work.)

### Building Images

    WIP

## Device Specifications

![Motorola Edge 2024](https://fdn2.gsmarena.com/vv/pics/motorola/motorola-edge-2024-2.jpg)

Hardware  | Device Name
-------:|:-------------------------
SoC     | Qualcomm SM7435-AB Snapdragon 7s Gen 2 (4 nm)
CPU     | Octa-core (4x2.40 GHz Cortex-A78 & 4x1.95 GHz Cortex-A55)
GPU     | Adreno 710
Memory  | 8 GB RAM (LPDDR4X)
Shipped Android Version | 13.0, My UX 3.0 (Global)
Storage | 256 GB (UFS 2.2)
Battery | Non-removable Li-Po 5000 mAh battery
Display | P-OLED, 1B clrs, 144Hz, HDR10+, 1300nit, 2400x1080, 6.67" (~402 ppi density)
Camera  | 50MP (Wide) + 13MP (Ultra-wide) + 32MP (Selfie)


# Credits

[@BobTheBlinker](https://github.com/BobTheBlinker) *for device trees*
[@twrpdtgen](https://github.com/twrpdtgen/) *for device tree generator*
[GSMArena](https://gsmarena.com/) *for device specs/and images*
[erfanoabdi](https://xdaforums.com/m/erfanoabdi.6298645/) *for OTA link generator*
[@mlm-games](https://github.com/mlm-games/) *for GitHub actions builder*
[@minimal-manifest-twrp](https://github.com/minimal-manifest-twrp) *for TWRP manifest*

