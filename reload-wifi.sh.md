
modprobe -r ath10k_pci && modprobe ath10k_pci
systemctl restart iwd && systemctl restart systemd-networkd
