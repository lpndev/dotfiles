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
git clone https://github.com/lpndev/dotfiles /mnt/etc/nixos
nixos-install --flake /mnt/etc/nixos#<host>

# set user password
nixos-enter --root /mnt -c "passwd lain"

# reboot
reboot
```

### Rebuild

```sh
# set repository ownership
sudo chown -R lain:users /etc/nixos

# rebuild and switch system
sudo nixos-rebuild switch --flake /etc/nixos#<host>
```

### Maintenance

```sh
# update flake inputs
git add .
sudo nix flake update

# collect unused store paths
sudo nix store gc

# delete old generations & garbage
sudo nix-collect-garbage -d
```

### Useful Commands

```sh
# list flake outputs and hosts
nix flake show /etc/nixos

# list system generations
sudo nixos-rebuild list-generations

# rollback to previous generation
sudo nixos-rebuild switch --rollback

# test configuration without making it boot default
sudo nixos-rebuild test --flake /etc/nixos#

# build configuration without activating it
sudo nixos-rebuild build --flake /etc/nixos#
```
