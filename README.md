# PNETLab v6 - Custom Offline Installer

This repository provides a minor, independent optimization for the PNETLab installation script, featuring an updated shared file.
<br>
The PNETLab version referred to is **6.0.0-103** (released around the summer of 2025), a critical community-driven update that patches PHP 7.4. PNETLab v6 is built to run on Ubuntu Server 20.04.6 LTS.
<br>


## Installation Guide
### 1 - Download and Install **Ubuntu Server 20.04.6 LTS**:
* **[Mirror 1 - Official](https://www.releases.ubuntu.com/focal/)**
* **[Mirror 2](https://drive.google.com/file/d/1vuepEsuFY0cQ90jPxLWPBppFstI8Qp2z/view?usp=sharing)**
<br>

### 2 - Update System Packages:

```bash
sudo apt update && sudo apt upgrade -y
```
<br>

### 3 - Download and Upload PNETLab v6 Installer to Ubuntu:

Download the **offline-pnetlab-v6-0.0-103_patched_libsdl2_optimized_install.tar.gz** file. 
* **[Mirror 2](https://wdfiles.ru/1v4u7)**
* **[Mirror 1](https://drive.google.com/file/d/1bGR_HjNnUQ5bP0ceBjGvqgVykPn78kpY/view?usp=sharing)**
<br>


Upload the *.tar.gz* file to Ubuntu Server **/tmp** directory, using an FTP client like WinSCP or FileZilla.
<br>

Extract the content from the file:

```bash
sudo tar -xvzf offline-pnetlab-v6-0.0-103_patched_libsdl2_optimized_install.tar.gz
```
<br>

### 4 - Install PNETLab:

```bash
cd offline-pnetlab-v6-0.0-103_patched_libsdl2_optimized_install/
sudo chmod +x install_pnetlab_v6.sh
sudo ./install_pnetlab_v6.sh
```
Perform a reboot after concluding the installation:
```bash
sudo reboot
```

<br>

#### ⚠️ System credentials are replaced by PNETLab's default after installation.
* **CLI Access:** root / pnet

* **GUI Access:** admin / pnet
<br>

### 5. Upload node images and Have Fun with the Network Simulator! 🎉
<br>

* [ishare2](https://github.com/ishare2-org/ishare2-cli) - Tool that helps download and manage images
* [LabHub Repository](https://legacy.labhub.eu.org/0:/)

<br>

> [!CAUTION]
> **DO NOT UPGRADE THE OS AFTER INSTALLATION**
> <br>
> Running a system upgrade after installation can break PnetLab, since it relies on specific library versions and was built for Ubuntu Server 20.04.6 LTS.
<br>


## Credits
All credit belongs to **PNETLab** and the vibrant community that helps to maintain and evolve the platform. 

Additionally, a big thank you to **Canonical** for providing such an incredible operating system like Ubuntu Server. Your work makes community projects like this possible!

*Big thank you to both!*

## Disclaimer
All original software, binaries, and trademarks belong exclusively to their respective owners. This repository does not own these files. The provided links are shared solely as an independent mirror to assist the community with Network Emulation. This project is not affiliated with or endorsed by PNETLab or Canonical.
