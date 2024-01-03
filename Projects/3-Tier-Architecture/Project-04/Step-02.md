# Configure "NFS Server"

## Step 2 – Configure Logical Volume on the "NFS Server" 

1. Open up the Linux terminal 

2. SSH into the "NFS Server" to begin configuration

3. Use lsblk command to inspect what block devices are attached to the server. Notice names of your newly created devices. All devices in Linux reside in /dev/ directory. Inspect it with ls /dev/ and make sure you see all 3 newly created block devices there – their names will likely be xvdf, xvdh, xvdg.

```
lsblk
```

![5024](https://user-images.githubusercontent.com/85270361/210137484-e3928617-0f73-42c1-bc76-bf9d86d60710.PNG)

4. Use df -h command to see all mounts and free space on your server

```
df -h
```

5. Use gdisk utility to create a single partition on each of the 3 disks

```
sudo gdisk /dev/xvdf
```

PROMPT: 

```
 GPT fdisk (gdisk) version 1.0.3

Partition table scan:
  MBR: not present
  BSD: not present
  APM: not present
  GPT: not present

Creating new GPT entries.

Command (? for help branch segun-edits: p
Disk /dev/xvdf: 20971520 sectors, 10.0 GiB
Sector size (logical/physical): 512/512 bytes
Disk identifier (GUID): D936A35E-CE80-41A1-B87E-54D2044D160B
Partition table holds up to 128 entries
Main partition table begins at sector 2 and ends at sector 33
First usable sector is 34, last usable sector is 20971486
Partitions will be aligned on 2048-sector boundaries
Total free space is 2014 sectors (1007.0 KiB)

Number  Start (sector)    End (sector)  Size       Code  Name
   1            2048        20971486   10.0 GiB    8E00  Linux LVM

Command (? for help): w

Final checks complete. About to write GPT data. THIS WILL OVERWRITE EXISTING
PARTITIONS!!

Do you want to proceed? (Y/N): yes
OK; writing new GUID partition table (GPT) to /dev/xvdf.
```
The operation has completed successfully.
Now, your changes has been configured succesfuly, exit out of the gdisk console and do the same for the remaining disks.

```
sudo gdisk /dev/xvdf
```

```
sudo gdisk /dev/xvdf
```

5. Use lsblk utility to view the newly configured partition on each of the 3 disks.

![5025](https://user-images.githubusercontent.com/85270361/210137616-558c1857-6fca-40e4-a833-f4605fcd46ca.PNG)


6. Install lvm2 package and run lvmdiskscan command to check for available partitions.

```
sudo yum install lvm2
```

```
sudo lvmdiskscan
```

7. Use pvcreate utility to mark each of 3 disks as physical volumes (PVs) to be used by LVM

```
sudo pvcreate /dev/xvdf1
sudo pvcreate /dev/xvdg1
sudo pvcreate /dev/xvdh1
```

8. Verify that your Physical volume has been created successfully by running sudo pvs

![5026](https://user-images.githubusercontent.com/85270361/210137702-7d0c0151-0cf8-4d61-a1af-a146afc9e26a.PNG)


9. Use vgcreate utility to add all 3 PVs to a volume group (VG). Name the VG webdata-vg

```
sudo vgcreate webdata-vg /dev/xvdh1 /dev/xvdg1 /dev/xvdf1
```

10. Verify that your VG has been created successfully by running 

```
sudo vgs
```

11. Use lvcreate utility to create 2 logical volumes. apps-lv (Use half of the PV size), and logs-lv Use the remaining space of
 the PV size. NOTE: apps-lv will be used to store data for the Website while, logs-lv will be used to store data for logs.
 
```
sudo lvcreate -n lv-opt -L 9G webdata-vg
sudo lvcreate -n lv-apps -L 9G webdata-vg
sudo lvcreate -n lv-logs -L 9G webdata-vg

```

12. Verify that your Logical Volume has been created successfully by running 

```
sudo lvs
```

13. Verify the entire setup

```
sudo vgdisplay -v #view complete setup - VG, PV, and LV
sudo lsblk 
```

14. Use mkfs.xfs to format the logical volumes with xfs filesystem

```
sudo mkfs -t xfs /dev/webdata-vg/lv-apps
sudo mkfs -t xfs /dev/webdata-vg/lv-logs
sudo mkfs -t xfs /dev/webdata-vg/lv-opt
```

15. Create /mnt/apps directory to store website files

```
sudo mkdir /mnt/apps
```
16. Create /mnt/logs directory to store logs

```
sudo mkdir /mnt/logs
```
17. Create /mnt/opt directory to store installed applications

```
sudo mkdir /mnt/opt
```

18. Mount /mnt/apps on lv-apps logical volume

```
sudo mount /dev/webdata-vg/lv-apps /mnt/apps
```

19. Mount /mnt/logs on lv-logs logical volume.

```
sudo mount /dev/webdata-vg/lv-logs /mnt/logs
```

20. Mount /mnt/opt on lv-opt logical volume.

```
sudo mount /dev/webdata-vg/lv-opt /mnt/opt
```

21. Update /etc/fstab file so that the mount configuration will persist after restart of the server.

 UPDATE THE `/ETC/FSTAB` FILE

The UUID of the device will be used to update the /etc/fstab file;

```
sudo blkid
```

![5030](https://user-images.githubusercontent.com/85270361/210138145-4da8745a-86be-4110-8abd-ee7d6363ba33.PNG)

```
sudo vi /etc/fstab
```

Update /etc/fstab in this format using your own UUID and rememeber to remove the leading and ending quotes.

![5031](https://user-images.githubusercontent.com/85270361/210138190-36d404db-1ad5-4dbb-ad02-c1adfa865e0a.PNG)


22. Test the configuration and reload the daemon

```
sudo mount -a
sudo systemctl daemon-reload
```

23. Verify your setup by running df -h, output must look like this:

![5032](https://user-images.githubusercontent.com/85270361/210138253-28ab8647-88be-4b59-9bad-c981014cdc4b.PNG)

