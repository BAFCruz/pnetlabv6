# PNETLab v6 - Custom Offline Installer

This repository provides minor, independent optimizations for the PNETLab offline installation, featuring updated packages.
<br>
The PNETLab version referred to is **6.0.0-103** (released around the summer of 2025), a critical community-driven update that transitioned the platform to PHP 7.4. 
<br>
PNETLab v6 is built to run on Ubuntu 20.04.
<br>
<br>

### Changelog
* **Optimized Core Libraries:** Streamlined system dependencies by removing redundant libraries and introducing new ones to reduce latency and improve HTML console responsiveness.
* **Updated Core Binary:** Upgraded `pnetlab-guacamole` from `6.0.0-7` to `6.0.0-30` for improved stability and protocol handling.
* **Automated JVM Tuning:** Introduced an [automated configuration script](https://github.com/BAFCruz/pnetlabv6/blob/main/tune_tomcat.sh) for Tomcat9 that dynamically allocates Java Heap, based on system RAM, and enforces performance-optimized settings:
    * **Fixed Heap Allocation (`-Xms`, `-Xmx`):** Eliminates heap-resizing latency during high-load periods, to prevent temporary UI freezes.
    * **Explicit G1GC:** Enforces, even though it should by default, garbage collection to prevent "Stop-The-World" UI freezes.
    * **Entropy Optimization (`/dev/urandom`):** Removes startup bottlenecks associated with secure random number generation, caused by JVM waiting for sufficient entropy.
    * **Memory Safeguards:** Implements `MaxMetaspaceSize` limits to prevent metadata leaks from impacting host stability.
<br>

**[PNETLab Overview - DeepWiki](https://deepwiki.com/pnetlab/pnetlab_main/1-pnetlab-overview)** | 
**[PNETLab Mainpage](https://www.pnetlab.com/pages/main)** | 
**[LabHub Repository](https://legacy.labhub.eu.org/0:/)**

<br>

## Installation Guide
### 1 - Download and Install **Ubuntu Server 20.04.6 LTS**:
* **[Mirror 1 - Official](https://www.releases.ubuntu.com/focal/)**
* **[Mirror 2](https://drive.google.com/file/d/1vuepEsuFY0cQ90jPxLWPBppFstI8Qp2z/view?usp=sharing)**
<br>

⚠️ On an Hypervisor ensure the VM Option "Enable UEFI secure boot", or its equivalent, is disabled in order to boot into the system after concluding Step 4.
<br>
<br>

### 2 - Update System Packages:

```bash
sudo apt update && sudo apt upgrade -y
```
<br>

### 3 - Download and Upload PNETLab v6 Installer to Ubuntu:

Download the **offline-pnetlab-v6-0.0-103_upgraded_guacamole_optimized_libs.tar.gz** file.
* **[Mirror 1](https://drive.google.com/file/d/17ZouMAYiLJxhOGShOFSeYruEHE-bk9Ni/view?usp=sharing)**
* **[Mirror 2](https://wdfiles.ru/1v54m)**
<br>


Upload the *.tar.gz* file to Ubuntu Server **/tmp** directory, using an FTP client like WinSCP or FileZilla.
<br>

Extract the content from the file:

```bash
sudo tar -xvzf offline-pnetlab-v6-0.0-103_upgraded_guacamole_optimized_libs.tar.gz
```
<br>

### 4 - Install PNETLab:

```bash
cd offline-pnetlab-v6-0.0-103_upgraded_guacamole_optimized_libs/
sudo chmod +x install_pnetlab_v6.sh
sudo ./install_pnetlab_v6.sh
```

Perform a reboot after concluding the installation:
```bash
sudo reboot
```

<br>

#### ⚠️ System credentials are replaced by PNETLab's default after rebooting.
* **CLI Access:** root / pnet

* **GUI Access:** admin / pnet
<br>


### 5. Upload node images and Have Fun with the Network Simulator! 🎉
<br>

* [LabHub Repository](https://legacy.labhub.eu.org/0:/)
* [ishare2](https://github.com/ishare2-org/ishare2-cli)
<br>

> [!CAUTION]
> **DO NOT UPGRADE THE OS AFTER INSTALLATION**
> <br>
> Running a system upgrade after installation can break PnetLab, since it relies on specific library versions and was customly built for Ubuntu 20.04.
<br>


### 6. Optimize HTML console responsiveness (Optional but Highly Recommended)
After rebooting and sucessfully logging into PNetLab.
<br>

Download the [tune tomcat script](https://github.com/BAFCruz/pnetlabv6/blob/main/tune_tomcat.sh).
<br>

Upload the script to Ubuntu Server **/tmp** directory, using an FTP client like WinSCP or FileZilla.
<br>

Run the script:
```bash
cd /tmp
sudo chmod +x tune_tomcat.sh
sudo ./tune_tomcat.sh
```
<br>




## Credits
All credit belongs to **PNETLab** and the vibrant community for the incredible platform and continous evolution.
<br>
Additionally, a big thank you to **Canonical** for providing such an incredible operating system like Ubuntu. Your work makes community projects like this possible!

*Deep gratitue to both sides!*

## Disclaimer
All trademarks, binaries, and software belong to their respective owners. 
<br>
This independent mirror is provided solely for educational and community support in network emulation. 
<br>
This project is not affiliated with, sponsored by, or endorsed by the mentioned parties.
