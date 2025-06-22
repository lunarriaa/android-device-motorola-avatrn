# Android device tree for motorola motorola edge 2024 (msi)

How to dump yourself

Download your firmware from https://mirrors.lolinet.com/firmware/lenomola/2024/avatrn/
RETCA is Retail Canada
RETUS is Retail US (Which is what this tree used)

```bash
sudo apt-get install python3
pip install dumpyara
python3 -m dumpyara ./XT2405_...xml.zip
```

```bash
pip install aospdtgen
python3 -m aospdtgen -o {output folder} ./XT2405_...xml.zip
```

Any error you get relating to unpackbootimg or AIK extraction is due to a dependency error or something, I haven't solved why that happens yet, but I ran both on Arch Linux and it worked fine, but Debian did not.

```
#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
```
