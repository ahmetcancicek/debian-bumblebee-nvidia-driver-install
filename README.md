# Install Bumblebee Nvidia Driver on Debian 10

# Install

```
cd ~/Downloads
git clone https://github.com/ahmetcancicek/debian-bumblebee-nvidia-driver-install.git
cd debian-bumblebee-nvidia-deriver-install
make .INSTALL
```

# Nvidia X Server Settings

If rebooted your machine, you can use command for opening Nvidia X Server Settings.

``` optirun nvidia-settings -c :8 ```

