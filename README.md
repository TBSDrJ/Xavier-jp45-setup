# Xavier-jp45-setup

There are three scripts to run in sequence, first and third as user and second as root.  

Many thanks to [Jetson Hacks](https://github.com/jetsonhacks/)

# 2022-03-21 Modified this for Jetpack 4.6 (Note: NOT for 4.6.1)

**Before starting**, I did all of the following:
* Download JetPack 4.6 from [Nvidia Developer](https://developer.nvidia.com/embedded/downloads)
* Copy the disk image onto a Micro SD card.
* Boot, accept license, do the basic Ubuntu setup.  I chose to auto-login and to push power usage to 20W_6CORE.
* Re-boot, hit 'Next' through the gnome-initial-setup
* Remove the three LibreOffice icons from Launcher
* Add Software Updater, Software & Updates, Chromium, Terminal, and gedit to the Lanucher
* Open Settings > Brightness & Lock > then:
  * Set to never sleep
  * Never require password
  * Lock off
* Restart after all that.
* Run Software Updater, install all updates. (~12 minutes) _Note_: As part of this update, it will have a dialog box to confirm that you want to start Docker as part of the bootup, check the box to agree to start Docker, and hit 'Next.'
* Restart again.
* Clone this repository
* You will need to move these shell scripts to the user's home directory, and then use `chmod 744 install*` to make them exectuable.

Then, run:
1. install_user_step_1.sh (as user).  This is pretty quick, depends on your network speed.
2. install_sudo_step_2.sh (as root, so with sudo) This takes about 22 minutes.
3. install_user_step_3.sh (as user).  This is 40+ minutes.

Then, you can run the two scripts in ~/Downloads/rootOnNVMe to push the filesystem out to the NVMe drive.

This installs, as root:
* Pip 21.3 for Python 3.6.9
* Tensorflow 2.5
* Intel RealSense SDK 2.50
* A udev rule that identifies the Dynamixel controller U2D2 and sets it as readable/writeable by the user

And, as user:
* Pytorch 1.10.0
* Torchvision 0.11.0
* Scikit-learn 0.24.2
* Scikit-image 0.17.2
* Dynamixel SDK 3.7.31
* Matplotlib 3.3.4
* Scipy 1.5.4
* Pillow (PIL) 8.4.0

Notice that Open CV 4.1.1 is pre-installed as root, with CUDA support in JetPack 4.6.

Once all this done, you should run the two scripts in ~/rootOnNVMe
