#!/bin/sh

[ "$(id -u)" -ne 0 ] && {
    echo 'Run this script as root to prevent permission errors.'
    exit 1
}

if [["$(lsb_release -is)" != "Debian"]]; then 
	echo 'This script is only supported on Debian/Ubuntu/Raspberry Pi OS.'
	exit 1
elif [["$(lsb_release -is)" != "Ubuntu"]]; then
	echo 'This script is only supported on Debian/Ubuntu/Raspberry Pi OS.'
	exit 1
fi

clear
cat << EOF

    | Pi-Checkra 0.1
    | by Creeper215
    | Only for arm64

EOF

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
apt update
apt upgrade -y
apt install -y git usbmuxd libimobiledevice6 libimobiledevice-utils \
build-essential checkinstall git autoconf automake libtool-bin libreadline-dev \
libusb-1.0-0-dev libusbmuxd-tools sshpass
mkdir /pi-checkra
cd /pi-checkra
git clone https://github.com/libimobiledevice/libplist.git
cd libplist
./autogen.sh
sudo make
sudo make install
sudo ldconfig
cd ..
git clone https://github.com/libimobiledevice/libimobiledevice-glue
cd libimobiledevice-glue
./autogen.sh
sudo make
sudo make install
cd ..
git clone https://github.com/libimobiledevice/libirecovery
cd libirecovery
./autogen.sh
sudo make
sudo make install
cd ..
wget https://assets.checkra.in/downloads/linux/cli/arm64/43019a573ab1c866fe88edb1f2dd5bb38b0caf135533ee0d6e3ed720256b89d0/checkra1n
chmod +x checkra1n
touch /start-picheckra.sh
cat << 'EOF' > /start-picheckra.sh
    while true; do
      if idevice_id -l > /dev/null 2>&1 && [ -n "$(idevice_id -l)" ]; then
        echo 'Putting connected iDevice in Recovery Mode.'
        ideviceenterrecovery "$(idevice_id -l)"
        sleep 4

      elif lsusb | grep -q 'Recovery'; then
        echo 'iDevice is in recovery mode.'
        /usr/local/bin/irecovery -c 'setenv auto-boot true'
        /usr/local/bin/irecovery -c 'saveenv'
        sudo /pi-checkra/checkra1n -c
        exit
      fi
      sleep 1
    done
EOF
chmod +x /start-picheckra.sh
cat << EOF > /etc/systemd/system/pi-checkra.service
[Unit]
Description=pi-checkra
After=multi-user.target

[Service]
ExecStart=/bin/bash /start-picheckra.sh

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable pi-checkra.service
systemctl start pi-checkra.service
clear
echo 'The installation is now finished! Please reboot the device using "sudo reboot now" to apply changes.'
