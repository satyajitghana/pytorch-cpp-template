#!/bin/bash

# bazel
curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -
sudo sh -c echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
sudo apt update
sudo apt install bazel -y