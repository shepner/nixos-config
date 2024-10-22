
## Initial system prep

In windows do the following:
- Uninstall anything that doesnt need to be there
- [disable Fast startup in Windows11](https://www.solveyourtech.com/how-to-disable-fast-startup-in-windows-11-a-step-by-step-guide/): `Control Panel > Hardware and Sound > Power Options > Choose what the power buttons do > Change settings that are currently unavailable` Uncheck `Turn on Fast Startup`, `Save changes`
- Disable Secure Boot: enter BIOS `Security > Secure Boot` make sure it is set to `Disabled`, save and exit
- also follow these instructions: https://sysguides.com/install-a-windows-11-virtual-machine-on-kvm
- And this also has some useful windows tweaks: https://github.com/andywhite37/nixos/blob/master/DUAL_BOOT_WINDOWS_GUIDE.md



Dual boot instal instructions:
- https://drakerossman.com/blog/how-to-dualboot-windows-and-nixos
  -  use this for everything else

---

**!!!These steps broke things!!!**


**Steps to enlarge `/dev/nvme0n1p1` (`/boot`)**

Backup the partition:
```
sudo mkdir /tmp/backed-up-boot
sudo mkdir /mnt/actual-boot
sudo mount /dev/nvme0n1p1 /mnt/actual-boot
sudo rsync -ah --progress /mnt/actual-boot /tmp/backed-up-boot
sudo umount /mnt/actual-boot
```

In GPartd, mark `/dev/nvme0n1p1` for deletion.  Create new one in that space:
- Create as: "Primary Partition"
- Partition name: "EFI System Partition"
- File system: "fat32"

Apply changes

Manage flags:
- boot
- esp
- no_automount

Copy the files back:
```
sudo mount /dev/nvme0n1p1 /mnt/actual-boot
sudo rsync -ah --progress /tmp/backed-up-boot /mnt/actual-boot
sudo umount /mnt/actual-boot
```

To fix NixOS, I ended up reinstalling

To fix Windows, I followed these instructions: https://blog.rickychon.me/fixing-windows-bootloader-after-installing-linux-dual-boot

---

Now boot using the [NixOS installer](https://nixos.org/download/#nixos-iso) and [follow the instructions](https://nixos.org/manual/nixos/stable/#sec-installation)



Run this to bootstrap the system configuration:

```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/shepner/nixos-config/refs/heads/main/bootstrap.sh)"
```
