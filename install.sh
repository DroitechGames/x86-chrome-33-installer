#!/bin/bash
# Remember to get the User who called sudo! 
if [ $SUDO_USER ]; then user=$SUDO_USER; else user=`whoami`; fi
echo "Installing Google Chrome for: "$user
sudo -u $user mkdir -p /home/$user/chrome/i386/install-files/
chmod 777 /home/$user/chrome/i386/install-files/
cd /home/$user/chrome/i386/install-files/
mkdir -p /var/bash/
touch /var/bash/.bash_aliases
echo "Installing..."
sleep 0.5
echo "Please Wait..."
sleep 0.5
echo "Installing prerequsite files via APT..."
sleep 0.5
echo ""
apt install -y gconf-service libgconf-2-4 libpango1.0-0 libappindicator1 multiarch-support rar unrar
echo ""
echo "Removing LibCurl4 for compatability issue with LibCurl3"
sleep 0.5
apt remove -y libcurl4
echo ""
sleep 0.5
echo "Downloading LibSSL 1.0"
wget http://packages.linuxmint.com/pool/upstream/o/openssl/libssl1.0.0_1.0.1j-1_i386.deb
sleep 0.5
echo "Installing LibSSl 1.0"
dpkg -i libssl1.0.0_1.0.1j-1_i386.deb
sleep 0.5
echo "Downloading LibSSL 1.2"
echo ""
wget http://ftp.uk.debian.org/debian/pool/main/o/openssl1.0/libssl1.0.2_1.0.2u-1~deb9u1_i386.deb
sleep 0.5
echo ""
echo "Installing LibSSl 1.2"
echo ""
dpkg -i libssl1.0.2_1.0.2u-1~deb9u1_i386.deb
sleep 0.5
echo ""
echo "Downloading LibCurl3"
wget http://security.debian.org/debian-security/pool/updates/main/c/curl/libcurl3_7.52.1-5+deb9u10_i386.deb
echo ""
dpkg -i libcurl3_7.52.1-5+deb9u10_i386.deb
sleep 0.5
echo ""
echo "Done..."
chmod 777 /home/$user/chrome/i386/install-files/*
echo ""
echo "Downloading Google Chrome..."
#
#   Google Drive Downloader.
#   For
#   Google Chrome Version 33 (32 bit Linux - deb10)
#
echo "Google Chrome Version 33 Installer. 32Bit. Debain 10."
echo "..."
sleep 0.5
CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id=1ofFd0pleLzEGQREkpw3mVeLoXJ6iBiFm" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')
echo "Preparing..."
sleep 0.5
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$CONFIRM&id=1ofFd0pleLzEGQREkpw3mVeLoXJ6iBiFm" -O 'google-chrome-stable_48.0.2564.116-1_i386.deb'
sleep 0.5
echo "Chrome Downloaded..."
rm -rf /tmp/cookies.txt
echo "Cleaning up and Installing Chrome..."
dpkg -i google-chrome-stable_48.0.2564.116-1_i386.deb
echo "Done..."
