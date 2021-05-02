##### STEP 1, RUN THIS AS USER
# Assumes JetPack 4.5
# JP 4.5 includes a full OpenCV build including CUDA support.

# Download Tensorflow wheel
wget https://developer.download.nvidia.com/compute/redist/jp/v45/tensorflow/tensorflow-2.4.0+nv21.4-cp36-cp36m-linux_aarch64.whl

# Download Pytorch wheel
wget https://nvidia.box.com/shared/static/p57jwntv436lfrd78inwl7iml6p13fzh.whl -O torch-1.8.0-cp36-cp36m-linux_aarch64.whl

# Download RealSenseSDK loader script
git clone https://github.com/jetsonhacks/installrealsensesdk ~/Downloads/installRealSenseSDK

# Download script to transfer file system to NVMe drive
git clone https://github.com/jetsonhacks/rootonnvme ~/Downloads/rootOnNVMe

# Download torchvision repository
# From: https://forums.developer.nvidia.com/t/pytorch-for-jetson-version-1-8-0-now-available/72048
git clone --branch v0.9.0 https://github.com/pytorch/vision ~/Downloads/torchvision
