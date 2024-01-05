# LAUNCH AN EC2 INSTANCE THAT WILL SERVE AS “WEB SERVER”.

Step 1 — Prepare a Web Server

1. Launch an EC2 instance that will serve as "Web Server". Create 3 volumes in the same AZ as your Web Server EC2, each of 10 GiB.
Learn How to Add EBS Volume to an EC2 instance here

![5022](https://user-images.githubusercontent.com/85270361/210136900-8369cbb5-47fc-4ea1-a8a0-4746881fab44.PNG)


2. Attach all three volumes one by one to your Web Server EC2 instance

![5023](https://user-images.githubusercontent.com/85270361/210136972-6c812c34-9dfa-4605-92ec-afb0d7881bbb.PNG)


3. Open up the Linux terminal to begin configuration

4. Use lsblk command to inspect what block devices are attached to the server. Notice names of your newly created devices. All devices
in Linux reside in /dev/ directory. Inspect it with ls /dev/ and make sure you see all 3 newly created block devices there – their 
names will likely be xvdf, xvdh, xvdg.

```
lsblk
```

Outcome 
```
[ec2-user@ip-172-31-59-249 ~]$ lsblk
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
xvda    202:0    0   10G  0 disk
├─xvda1 202:1    0    1M  0 part
├─xvda2 202:2    0  200M  0 part /boot/efi
├─xvda3 202:3    0  600M  0 part /boot
└─xvda4 202:4    0  9.2G  0 part /
xvdf    202:80   0   10G  0 disk
xvdg    202:96   0   10G  0 disk
xvdh    202:112  0   10G  0 disk
```



5. To create partitions Use gdisk utility to create a single partition on each of the 3 disks

After launching gdisk, you can use the 'n' command to create a new partition and follow the prompts to set the partition size, type, etc. After defining your partitions, don't forget to use the 'w' command to write the changes to the disk.

```
sudo gdisk /dev/xvdf
```
Example: 
```
Command (? for help): n
Partition number (1-128, default 1): 1
First sector (34-20971486, default = 2048): [press Enter]
Last sector (2048-20971486, default = 20971486): [press Enter]
Hex code or GUID (L to show codes, Enter = 8300): [press Enter]

Command (? for help): w
```

This will create a new partition on /dev/xvdf. After this, you can format the partition and mount it as needed.
Now,  your changes has been configured succesfuly, exit out of the gdisk console.

6. Create partitions for other disks /dev/xvdh and /dev/xvdg.

```
sudo gdisk /dev/xvdh
```

```
sudo gdisk /dev/xvdg
```

7. Use lsblk utility to view the newly configured partition on each of the 3 disks.

```
lsblk
```

Outcome 
```
[ec2-user@ip-172-31-59-249 ~]$ lsblk
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
xvda    202:0    0   10G  0 disk
├─xvda1 202:1    0    1M  0 part
├─xvda2 202:2    0  200M  0 part /boot/efi
├─xvda3 202:3    0  600M  0 part /boot
└─xvda4 202:4    0  9.2G  0 part /
xvdf    202:80   0   10G  0 disk
└─xvdf1 202:81   0   10G  0 part
xvdg    202:96   0   10G  0 disk
└─xvdg1 202:97   0   10G  0 part
xvdh    202:112  0   10G  0 disk
└─xvdh1 202:113  0   10G  0 part
```

8. Install lvm2 package. 

```
sudo yum install lvm2 -y 
```
9. Run sudo lvmdiskscan command to check for available partitions.

```
sudo lvmdiskscan
```

10. Use pvcreate utility to mark each of 3 disks as physical volumes (PVs) to be used by LVM

```
sudo pvcreate /dev/xvdf1
sudo pvcreate /dev/xvdg1
sudo pvcreate /dev/xvdh1
```

11. Verify that your Physical volume has been created successfully

```
 sudo pvs
```
Outcome
```
[ec2-user@ip-172-31-59-249 ~]$ sudo pvs
  PV         VG Fmt  Attr PSize   PFree
  /dev/xvdf1    lvm2 ---  <10.00g <10.00g
  /dev/xvdg1    lvm2 ---  <10.00g <10.00g
  /dev/xvdh1    lvm2 ---  <10.00g <10.00g
```

12. Use vgcreate utility to add all 3 PVs to a volume group (VG). Name the VG webdata-vg

```
sudo vgcreate webdata-vg /dev/xvdh1 /dev/xvdg1 /dev/xvdf1
```

13. Verify that your VG has been created successfully by running 

```
sudo vgs
```
outcome
```
[ec2-user@ip-172-31-59-249 ~]$ sudo vgs
  VG         #PV #LV #SN Attr   VSize   VFree
  webdata-vg   3   0   0 wz--n- <29.99g <29.99g
```

14. Use lvcreate utility to create 2 logical volumes. apps-lv (Use half of the PV size), and logs-lv Use the remaining space of
 the PV size. NOTE: apps-lv will be used to store data for the Website while, logs-lv will be used to store data for logs.
 
```
sudo lvcreate -n apps-lv -L 14G webdata-vg
sudo lvcreate -n logs-lv -L 14G webdata-vg
```

15. Verify that your Logical Volume has been created successfully by running 

```
sudo lvs
```

![5029](https://user-images.githubusercontent.com/85270361/210137927-8aef5842-f176-45a4-bf5c-817fc1eeb1fb.PNG)


16. Verify the entire setup

```
sudo vgdisplay -v #view complete setup - VG, PV, and LV
sudo lsblk 
```

17. Use mkfs.ext4 to format the logical volumes with ext4 filesystem

```
sudo mkfs -t ext4 /dev/webdata-vg/apps-lv
sudo mkfs -t ext4 /dev/webdata-vg/logs-lv
```

18. Create /var/www/html directory to store website files

```
sudo mkdir -p /var/www/html
```

19. Create /home/recovery/logs to store backup of log data

```
sudo mkdir -p /home/recovery/logs
```

20. Mount /var/www/html on apps-lv logical volume

```
sudo mount /dev/webdata-vg/apps-lv /var/www/html/
```

21. Use rsync utility to backup all the files in the log directory /var/log into /home/recovery/logs (This is required before 
mounting the file system)

```
sudo rsync -av /var/log/. /home/recovery/logs/
```


22. Mount /var/log on logs-lv logical volume. (Note that all the existing data on /var/log will be deleted. That is why step 15 above 
is very important)

```
sudo mount /dev/webdata-vg/logs-lv /var/log
```

23. Restore log files back into /var/log directory

```
sudo rsync -av /home/recovery/logs/. /var/log
```

24. Update /etc/fstab file so that the mount configuration will persist after restart of the server.
Click on the next Step To update the /etc/fstab file


