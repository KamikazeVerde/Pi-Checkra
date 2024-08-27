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
   
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/KamikazeVerde/Pi-Checkra/blob/master/LICENSE.txt
