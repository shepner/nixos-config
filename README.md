
## Initial system prep

Instuctions for setting up a dual boot system.  The 2nd link is more useful:
- From: https://github.com/andywhite37/nixos/blob/master/DUAL_BOOT_WINDOWS_GUIDE.md
- https://drakerossman.com/blog/how-to-dualboot-windows-and-nixos

In windows do the following:
- [disable Fast startup in Windows11](https://www.solveyourtech.com/how-to-disable-fast-startup-in-windows-11-a-step-by-step-guide/): `Control Panel > Hardware and Sound > Power Options > Choose what the power buttons do > Change settings that are currently unavailable` Uncheck `Turn on Fast Startup`, `Save changes`
- Disable Secure Boot: enter BIOS `Security > Secure Boot` make sure it is set to `Disabled`, save and exit
- also follow these instructions: https://sysguides.com/install-a-windows-11-virtual-machine-on-kvm

Now boot using the [NixOS installer](https://nixos.org/download/#nixos-iso) and [follow the instructions](https://nixos.org/manual/nixos/stable/#sec-installation)




```
curl -fsSL https://raw.githubusercontent.com/shepner/nixos-config/refs/heads/main/bootstrap.sh
```
