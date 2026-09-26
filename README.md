### Login

```sh
# enter as root
sudo -i
```

### Partitioning

| Number | Mount   | Type       | Format | Size      |
| :----- | :------ | :--------- | :----- | :-------- |
| 1      | `/boot` | EFI System | FAT32  | 1 GiB     |
| 2      | `swap`  | Linux Swap | Swap   | 16 GiB    |
| 3      | `/`     | Linux FS   | Ext4   | Remainder |

#### Disk

```sh
# identify disk
fdisk -l

# start partitioning
DISK=/dev/nvme0n1
cfdisk $DISK

# define variables
EFI=${DISK}p1
SWAP=${DISK}p2
ROOT=${DISK}p3
```

#### Format

```sh
# format partitions
mkfs.vfat -F 32 $EFI
mkswap $SWAP
mkfs.ext4 $ROOT
```

#### Mount

```sh
# mount root, efi & swap
mount $ROOT /mnt
mount -m -o umask=077 $EFI /mnt/boot
swapon $SWAP
```

### Installation

```sh
# clone this repository and install
cd /mnt/etc/nixos
git clone https://github.com/lpndev/dotfiles
nixos-install --flake /etc/nixos#<host>

# set user password
nixos-enter --root /mnt -c "passwd lain"

# reboot
reboot
```

### Rebuild

```sh
sudo nixos-rebuild switch --flake /etc/nixos#<host>
```
