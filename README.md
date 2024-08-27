[![MIT License][license-shield]][license-url]

# Pi-Checkra

A tool to transform your device in a "jailbraker" for iDevices!

## Requirements:
- arm64 device (es. Pi5)
- debian / ubuntu (also based es. Raspberry Pi OS)
- working internet connection (required only for setup)

## Usage:
- Clone the repository using `git clone https://github.com/KamikazeVerde/Pi-Checkra.git`
- Then (if needed) give permissions to the file using `chmod +x install-picheckra.sh`
- Now run the script using `sudo ./install-picheckra.sh`
- If you still get permission errors, try chowning the file to your username using `chown (your username) install-picheckra.sh`

## How does it work
1. The script updates package manager's repos and fetches new packages or modified ones
2. The script clones required libraries' repos and builds them
3. The script fetches checkra1n from checkra.in
4. The scripts create a startup script that will be executed on startup by a service handled by systemd that goes by the name of pi-checkra.service

## Errors
- "Run as root"
Exec the script usind `sudo`
- "Unspported OS"
This means that you can't execute the script on the current distro. There is a workaround for this, even if it is not reccomended, it works, to setup the script for other distros head up to the next section of the readme. (also regarding architecture)

## Other architecture/distro workaround
#### This is not raccomdended!
To make the script work on other distros you need to setup a workaround by editing the script.
For first, edit the package manager name, for example if you want to run the script on Arch Linux, you'll need to replace `apt install` with `pacman -S`. After doing this, to make checkra1n work on your CPU's architecture, just go in the [checkra1n site](checkra.in) and copy the download link you need and replace it in the script, if you did everything correctly the script should now work on your distro/architecture!
Also, feel free to make forks for other distros and architectures!

[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/KamikazeVerde/Pi-Checkra/blob/master/LICENSE.txt
