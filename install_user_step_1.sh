##### STEP 1, RUN THIS AS USER
# Assumes JetPack 4.6
# JP 4.6 includes a full OpenCV build including CUDA support.

# Download Tensorflow wheel
wget https://developer.download.nvidia.com/compute/redist/jp/v45/tensorflow/tensorflow-2.5.0+nv21.6-cp36-cp36m-linux_aarch64.whl

# Download Pytorch wheel
wget https://nvidia.box.com/shared/static/fjtbno0vpo676a25cgvuqc1wty0fkkg6.whl -O torch-1.10.0-cp36-cp36m-linux_aarch64.whl

# Download RealSenseSDK loader script
git clone https://github.com/jetsonhacks/installrealsensesdk ~/Downloads/installRealSenseSDK

# Above is completed, working on below

# Download script to transfer file system to NVMe drive
git clone https://github.com/jetsonhacks/rootonnvme ~/Downloads/rootOnNVMe

# Download torchvision repository
# From: https://forums.developer.nvidia.com/t/pytorch-for-jetson-version-1-8-0-now-available/72048
git clone --branch v0.9.0 https://github.com/pytorch/vision ~/Downloads/torchvision
