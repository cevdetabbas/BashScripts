#!/bin/bash
# rsync var mi yok mu control et yoksa indir yukle
if ! command -v rsync &> /dev/null; then echo "rsync is not installed. Installing it now..."; if [ -f /etc/debian_version ]; then echo "Detected Debian-based system. Installing rsync using apt..."; sudo apt update && sudo apt install -y rsync; elif [ -f /etc/redhat-release ]; then echo "Detected Red Hat-based system. Installing rsync using yum..."; sudo yum install -y rsync; else echo "Unsupported system. Please install rsync manually."; exit 1; fi; else echo "rsync is already installed."; fi

# username
UN=$(ls /mnt/c/Users | grep -E 'cevo|tm')


# dosyalar tamam mi kontrol et
mkdir - p /root/zEnaktars
mkdir - p /root/zKilits

# butun hali hazirdaki olan var ise sil
rm -rf /root/zEnaktars/*
rm -rf /root/zKilits/*

# asil Enaktarlar ve kilitler One drive da olanlar onun icindir ki. ordan /root a kopyala

cp /mnt/c/Users/$UN/OneDrive/Desktop/zEnaktars /root/
cp /mnt/c/Users/$UN/OneDrive/Desktop/zKilits /root/

chmod 400 /root/zEnaktars/*
chmod 400 /root/zKilits/*

# diger scriptleri copyala
cp /mnt/c/Users/$UN/OneDrive/Documents/BashScripts/baglan /bin
cp /mnt/c/Users/$UN/OneDrive/Documents/BashScripts/knownhostutemizle /bin
chmod +x /bin/baglan
chmod +x /bin/knownhostutemizle


