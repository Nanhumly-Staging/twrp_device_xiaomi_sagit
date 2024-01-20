# TWRP Tree for Xiaomi Mi 6
```
#
# Copyright (C) 2012-2024 Team Win Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#
```

## Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | Octa-core (4x2.45 GHz Kryo & 4x1.9 GHz Kryo)
Chipset | Qualcomm MSM8998 Snapdragon 835
GPU     | Adreno 540
Memory  | 6 GB RAM
Shipped Android Version | 7.1.1
Storage | 64/128 GB
Battery | Li-Po 3350 mAh battery
Display | 1080 x 1920 pixels, 5.15 inches (~428 ppi pixel density)
Rear Camera  | Dual 12 MP (27mm, f/1.8, OIS 4-axis & 52mm, f/2.6), phase detection autofocus, dual-LED (dual tone) flash

## Device picture

![Xiaomi Mi 6](http://i8.mifile.cn/a1/pms_1492571518.47778002!560x560.jpg "Xiaomi Mi 6 in black")

## Kernel Source

https://github.com/Nanhumly-Staging/android_kernel_xiaomi_msm8998

## Compile

First repo init the TWRP 12.1 tree:

```shell
repo init -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
```

Sync source:

```shell
repo sync
```

Finally execute these:

```
.build/envsetup.sh
lunch twrp_sagit-eng
mka recoveryimage
```
