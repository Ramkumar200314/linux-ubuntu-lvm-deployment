# 🐧 Ubuntu Server Deployment & LVM Implementation

> **DevOps Relevance:** Linux storage management and disk scalability are core infrastructure skills for any DevOps/SRE engineer working with production systems.

---

## 📌 Project Overview

This project demonstrates the deployment of **Ubuntu Server 22.04** in a virtualized environment (VMware Workstation) and the implementation of **Logical Volume Management (LVM)** for flexible, scalable disk management — a critical real-world infrastructure skill.

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Ubuntu Server 22.04 | Host operating system |
| Linux CLI | System administration and configuration |
| LVM (Logical Volume Manager) | Flexible disk and storage management |
| VMware Workstation | Virtualization environment |

---

## 🎯 Objectives

- ✅ Install and configure Ubuntu Server 22.04
- ✅ Add and initialize an additional disk (`/dev/sdb`)
- ✅ Create Physical Volume (PV)
- ✅ Create Volume Group (VG)
- ✅ Create multiple Logical Volumes (LVs)
- ✅ Format and mount storage
- ✅ Troubleshoot LVM extent allocation issue

---

## 🧱 LVM Architecture

Physical Disk (/dev/sdb)
↓
Physical Volume (PV)
↓
Volume Group → lvmgrp
↓
┌───────────────────────────┐
│  LV1 → 3GB  │  LV2 → 3GB  │  LV3 → 3.9GB  │
└───────────────────────────┘

| Component | Name | Size |
|---|---|---|
| Physical Volume | /dev/sdb | Full disk |
| Volume Group | lvmgrp | Total available |
| Logical Volume 1 | lv1 | 3 GB |
| Logical Volume 2 | lv2 | 3 GB |
| Logical Volume 3 | lv3 | 3.9 GB |

---

## 🔍 Key Commands Used

All commands are documented in:
📄 [`commands/lvm_implementation_commands.sh`](commands/lvm_implementation_commands.sh)

Quick reference:

```bash
# Create Physical Volume
pvcreate /dev/sdb

# Create Volume Group
vgcreate lvmgrp /dev/sdb

# Create Logical Volumes
lvcreate -L 3G -n lv1 lvmgrp
lvcreate -L 3G -n lv2 lvmgrp
lvcreate -l 100%FREE -n lv3 lvmgrp

# Format and Mount
mkfs.ext4 /dev/lvmgrp/lv1
mount /dev/lvmgrp/lv1 /mnt/lv1

# Verify
lvdisplay
vgdisplay
pvdisplay
```

## 🔥 DevOps Relevance

This project directly demonstrates skills required for DevOps and Cloud Engineering roles:

| Skill | How It's Demonstrated |
|---|---|
| Linux System Administration | Full Ubuntu Server setup and CLI management |
| Storage Management | LVM implementation with PV, VG, LV creation |
| Disk Scalability | Flexible volume resizing without downtime |
| Real-world Infrastructure | Troubleshooting LVM extent allocation issues |
| Virtualization | VMware Workstation environment setup |

---

## 📬 Contact

**Developer:** Ram Kumar Kundrapu
🔗 [LinkedIn](https://linkedin.com/in/ramkumarkundrapu) | [GitHub](https://github.com/Ramkumar200314)
