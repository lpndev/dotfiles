## Downloading the ISO

**[Latest from official Microsoft ↗](https://www.microsoft.com/software-download/windows11)**

### Edit this iso using MicroWin from **[WinUtil ↗](https://github.com/ChrisTitusTech/winutil)**

## Create a Bootable USB Media

To create a bootable or multi-ISO USB drive, use one with at least 16–32 GB capacity. While there are several methods to create a bootable USB drive, the most practical are:

1. [**Balena Etcher**](https://etcher.balena.io/): This option transforms your entire USB drive into a specific installation medium using the downloaded .iso file. Note that you can't add other files to the drive, as everything will be deleted and converted to installation media only.
2. [**Ventoy**](https://www.ventoy.net/en/index.html): I recommend this option. It allows you to include multiple systems, create backups, and store files without limiting the USB drive to a single task. This versatility makes your drive multi-functional.

## Use an `autounattend.xml` file

You can automate the process of installation still more! And then you can use **[this website ↗](https://schneegans.de/windows/unattend-generator/)** to generate the autounattend file by just “asking questions”. Pretty ease and modern.

Use the template file to make things easier, remembering that I selected personal programs and settings. Remember to change the computer name, username and passwords:

**[autounattend.xml ↗](files/autounattend.xml)**

## Configure Ventoy (in the usb) to work with `autounattend.xml` file

Our folder structure should look like this:

```plain
ISO/     # Store image files (.iso) here
TOOLS/   # Place various utilities here, such as:
    CONFIG/   # Location for **autounattend.xml** file
    DRIVERS/  # Store external drivers here if needed
    PORTABLE/ # Keep useful portable apps in this folder
```

Create a file named `ventoy.json` and paste the following content into it:

```json
{
  "control": [
    {
      "VTOY_DEFAULT_SEARCH_ROOT": "/ISO"
    }
  ],
  "auto_install": [
    {
      "image": "/ISO/IMAGE_NAME_HERE.iso",
      "template": ["/TOOLS/CONFIG/autounattended.xml"]
    }
  ]
}
```

## Update system

First, we should fully update the system, including Microsoft Store apps, before proceeding with any other tasks.

## Reboot

After updating and activating the system, we must restart it completely to avoid errors and allow the system to finish updating.

## Run setup script

### Test winget before running the setup script

To avoid errors in the script, we should test winget first. Try searching for some packages. If no error messages or warnings appear, we're good to go.

```shell
winget search package
```

Since the test was performed without errors or warnings, open an **🛡️ admin terminal** and paste this code:

```shell
irm https://raw.githubusercontent.com/lpndev/dotfiles/main/windows/scripts/setup.ps1 | iex
```

Now, wait for installing all the apps

### Run WinUtil with 🛡️ admin terminal

```shell
irm "https://christitus.com/win" | iex
```

Import the `tweaks.json` file into it. Also, import the OOShutUp10 configuration from the Downloads folder.

## Removing Default NVIDIA Drivers and Using NVCleanInstall

1. If Windows automatically installs NVIDIA video card drivers, remove them using DDU (Display Driver Uninstaller).
2. After running DDU and uninstalling the current NVIDIA drivers (if the system has auto installed), we will now install the NVIDIA drivers from scratch using NVCleanInstall.

Here are some useful videos showing how to use DDU and optimize NVIDIA:

**[Boost Frames SIGNIFICANTLY Using DDU ↗](https://youtu.be/s2abMHbNBAs)**

**[Best Nvidia Driver For Performance | Benchmarks and Optimizations ↗](https://youtu.be/F15W9KwZjhc)**