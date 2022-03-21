##### STEP 2, RUN THIS AS ROOT (SUDO)

# Notice that all of the apt-get commands get a -y option because this means we automatically
#   respond 'Yes' whenever it would look to the user for input to confirm.  So, everything
#   just keeps rolling without pausing for user input.  I didn't bother to figure out which
#   ones actually needed it, I just put it in on all of them.

# Update and autoremove first just to make sure we are starting with a clean slate
apt-get -y update
apt-get -y autoremove

##########################
# TENSORFLOW
#
# This section follows: 
#   https://docs.nvidia.com/deeplearning/frameworks/install-tf-jetson-platform/index.html
#
# It matters that we use the apt install of pip even though it only gets us pip 9
# There are other packages that come along that are dependencies of tensorflow later
#   that won't get automaically installed later.
apt-get -y install python3-pip

# Now upgrade to pip 21
pip3 install -U pip

# Tensorflow dependencies 
apt-get -y install libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev liblapack-dev libblas-dev gfortran
pip3 install testresources setuptools==49.6.0
pip3 install -U numpy==1.19.4 future==0.18.2 mock==3.0.5 keras_preprocessing==1.1.2 keras_applications==1.0.8 gast==0.4.0 protobuf pybind11 cython pkgconfig
env H5PY_SETUP_REQUIRES=0 pip3 install -U h5py==3.1.0

# Install Tensorflow itself
# Downloaded from https://developer.nvidia.com/embedded/downloads
pip3 install tensorflow-2.5.0+nv21.8-cp36-cp36m-linux_aarch64.whl

# 2022-03-21 Will need to check on this:
# Notice that there is a line added to .bashrc that was needed by tensorflow to get
#    GPU acceleration fully functioning, see install_user_step_3.sh
#
# End of Tensorflow section
#############################

# Install Intel RealSense libraries
#    h/t: Jetson Hacks
~/Downloads/installRealSenseSDK/installLibrealsense.sh

##############################
# PYTORCH AND TORCHVISION
#
# This section follows:
# https://forums.developer.nvidia.com/t/pytorch-for-jetson-version-1-10-now-available/72048

# Some dependencies for Pytorch.  
# Notice that we skip what we've already done for Tensorflow above.
apt-get -y install libopenblas-base libopenmpi-dev 

# Some dependencies for Torchvision.
apt-get -y install libjpeg-dev zlib1g-dev libpython3-dev libavcodec-dev libavformat-dev libswscale-dev

# The rest happens as user.
#
# End of Pytorch section
##################################

# Set up udev rule so that U2D2 is readable/writeable by the student user automatically
echo 'SUBSYSTEM=="usb", ACTION=="add", ATTR{idVendor}=="0403", ATTR{idProduct}=="6014", SYMLINK+="dynamixel", OWNER="student", GROUP="student", MODE="0664"' > 80-dynamixel-controller-U2D2.rules
chown root 80-dynamixel-controller-U2D2.rules
chgrp root 80-dynamixel-controller-U2D2.rules
mv 80-dynamixel-controller-U2D2.rules /etc/udev/rules.d
