#!/bin/bash

# Switch to superuser
sudo su

# ===============================
# STEP 1: Create Physical Volume
# ===============================

pvcreate /dev/sdb

# Verify Physical Volume
pvdisplay


# ===============================
# STEP 2: Create Volume Group
# ===============================

vgcreate lvmgrp /dev/sdb

# Verify Volume Group
vgdisplay


# ===============================
# STEP 3: Create Logical Volume 1 (3GB)
# ===============================

lvcreate -n lv1 -L 3G lvmgrp

# Verify Logical Volume
lvdisplay


# ===============================
# STEP 4: Format and Mount lv1
# ===============================

mkdir /dirlv1

mkfs.ext4 /dev/lvmgrp/lv1

mount /dev/lvmgrp/lv1 /dirlv1

df -Th


# ===============================
# STEP 5: Create Logical Volume 2 (3GB)
# ===============================

lvcreate -n lv2 -L 3G lvmgrp

lvdisplay


# ===============================
# STEP 6: Format and Mount lv2
# ===============================

mkdir /dirlv2

mkfs.ext4 /dev/lvmgrp/lv2

mount /dev/lvmgrp/lv2 /dirlv2

df -Th


# ===============================
# STEP 7: Create Logical Volume 3 (3.9GB)
# ===============================

# Note: 4GB failed due to insufficient extents
# Error: Volume group has insufficient free space

lvcreate -n lv3 -L 3.9G lvmgrp

lvdisplay


# ===============================
# STEP 8: Format and Mount lv3
# ===============================

mkdir /dirlv3

mkfs.ext3 /dev/lvmgrp/lv3

mount /dev/lvmgrp/lv3 /dirlv3

df -Th


# ===============================
# STEP 9: Final Verification
# ===============================

lsblk