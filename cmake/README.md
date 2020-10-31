# LibTorch CMake template

Install Tools

```shell
sudo apt update && sudo apt upgrade
sudo apt install cmake
```

Download LibTorch

```shell
wget https://download.pytorch.org/libtorch/nightly/cpu/libtorch-shared-with-deps-latest.zip
unzip libtorch-shared-with-deps-latest.zip
```

copy the path where the above library was unzipped, and make sure to edit `CMakeList.txt` accordingly

## VSCode

Edit your include folders to match

```json
"includePath": [
    "${workspaceFolder}/**",
    "/home/shadowleaf/libtorch/include/torch/csrc/api/include/**",
    "/home/shadowleaf/libtorch/include/**"
],
```

Install [`https://github.com/microsoft/vscode-cmake-tools`](https://github.com/microsoft/vscode-cmake-tools)

Now you can use the CMake Build tools in VSCode to build and run the project
