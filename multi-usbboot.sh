
mount_allpoints() {
# Create the mountpoints
sudo mkdir /mnt/media/{efi,data}

# Mount the EFI partition
sudo mount /dev/sdb1 /mnt/media/efi
# Mount the data partition
sudo mount /dev/sdb2 /mnt/media/data
}


mount_allpoints
 
sudo grub-install \
  --verbose \
  --target=i386-pc \
  --recheck \
  --boot-directory="/mnt/media/efi/grub" /dev/sdb

# Installing grub for efi
sudo grub-install \
  --verbose \
  --target=x86_64-efi \
  --recheck \
  --removable \
  --efi-directory="/mnt/media/efi" \
  --boot-directory="/mnt/media/efi/grub" 