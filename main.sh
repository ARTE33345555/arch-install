#!/bin/bash

echo "=== Arch Linux Interactive Installer ==="

# --- 1. Choose language for the system ---
echo "Select system language (for locale, e.g., en_US.UTF-8, uk_UA.UTF-8):"
read SYS_LANG
echo "You selected: $SYS_LANG"

# --- 2. Show disks ---
echo "Available disks:"
lsblk
echo "Enter disk to install Linux (e.g., sda, sdb):"
read DISK_NUM
DISK="/dev/$DISK_NUM"

# --- 3. Confirm disk choice ---
echo "You selected $DISK"
read -p "This may modify partitions. Are you sure? (yes/NO): " CONFIRM
if [ "$CONFIRM" != "yes" ]; then
    echo "Installation cancelled."
    exit 1
fi

# --- 4. Choose installation type ---
echo "Select installation type:"
echo "1) Full Linux installation (will wipe disk)"
echo "2) Install Linux alongside existing OS (dual-boot)"
echo "3) Create Live CD / test environment"
read -p "Option (1/2/3): " INSTALL_OPTION

case $INSTALL_OPTION in
    1)
        echo "Full installation on $DISK"
        FULL_INSTALL=true
        ;;
    2)
        echo "Dual-boot setup: free space will be used for Linux"
        DUAL_BOOT=true
        echo "Enter size for Linux partition (e.g., 50G):"
        read LINUX_SIZE
        ;;
    3)
        echo "Live CD / temporary system"
        LIVE_CD=true
        ;;
    *)
        echo "Invalid option. Exiting."
        exit 1
        ;;
esac

# --- 5. Choose Desktop Environment ---
echo "Choose Desktop Environment (kde / gnome / xfce / none):"
read DE_NAME

# --- 6. Choose theme ---
read -p "Install a theme? Enter theme name or 'Skip': " THEME

# --- 7. Summary ---
echo "=== Installation Summary ==="
echo "Disk: $DISK"
if [ "$FULL_INSTALL" = true ]; then
    echo "Type: Full installation"
elif [ "$DUAL_BOOT" = true ]; then
    echo "Type: Dual-boot"
    echo "Linux partition size: $LINUX_SIZE"
elif [ "$LIVE_CD" = true ]; then
    echo "Type: Live CD"
fi
echo "Desktop Environment: $DE_NAME"
echo "Theme: $THEME"
echo "System language: $SYS_LANG"
read -p "Start installation? (yes/NO): " FINAL_CONFIRM
if [ "$FINAL_CONFIRM" != "yes" ]; then
    echo "Installation cancelled."
    exit 1
fi

# --- 8. Placeholder for installation commands ---
echo "Starting installation..."
echo "(Here you can add safe commands for partitioning, formatting, pacstrap, arch-chroot, GRUB, and system configuration)"
echo "This script is safe and does NOT modify your disk yet."

