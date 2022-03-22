###### STEP 3, RUN THIS AS USER

# Needed by Tensorflow to get it to properly find/allocate GPU
echo 'export LD_PRELOAD=$LD_PRELOAD:/usr/lib/aarch64-linux-gnu/libgomp.so.1' >> /home/student/.bashrc

# scikit-learn and scikit-image function better as user installs.
# There was some cache that wasn't useable if it was sudo installed
python3 -m pip install scikit-learn scikit-image

# Upgrade matplotlib, version was 2.1.1 without upgrade, get 3.3.4 with upgrade.
python3 -m pip install -U matplotlib

# This is needed by scikit-learn; I wasn't sure why a different libgomp was needed when we've
#   already pre-loaded one for Tensorflow, but it mattered in my tests.
echo 'export LD_PRELOAD=$LD_PRELOAD:/home/student/.local/lib/python3.6/site-packages/scikit_learn.libs/libgomp-d22c30c5.so.1.0.0' >> /home/student/.bashrc

# Install Pytorch
python3 -m pip install torch-1.10.0-cp36-cp36m-linux_aarch64.whl

# Environment variable for Torchvision setup.
export BUILD_VERSION=0.11.0

# Build torchvision from source (Ugh. Takes a while.). Notice install as user.
cd ~/Downloads/torchvision
python3 setup.py install --user
cd ~/

mv ~/tensorflow-2.5.0+nv21.8-cp36-cp36m-linux_aarch64.whl ~/Downloads
mv ~/torch-1.10.0-cp36-cp36m-linux_aarch64.whl ~/Downloads

# Install Dynamixel SDK
python3 -m pip install dynamixel-sdk
