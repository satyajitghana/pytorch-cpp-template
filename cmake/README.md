# LibTorch CMake template

This example uses `PyTorch 1.7.0`, it can be changed in `CMakeLists.txt` file

## Install Tools

```shell
sudo apt update && sudo apt upgrade
sudo apt install cmake
```

Make sure to install CMake 3.11.0 and higher

CMake Latest install in Ubuntu 18.04

```shell
# CMAKE latest
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | sudo apt-key add -
sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'
sudo apt update
sudo apt install cmake -y
```

LibTorch will be downloaded by CMake Build

## Build

```shell
mkdir build && cd build
cmake ..
make
```

## VSCode

Install [`https://github.com/microsoft/vscode-cmake-tools`](https://github.com/microsoft/vscode-cmake-tools)

Now you can use the CMake Build tools in VSCode to build and run the project

Add `vscode-cmake-tools` as your intellisense provider

```json
"configurations": [
    {
        "name": "Linux",
        "includePath": [
            "${workspaceFolder}/**"
        ],
        ...
        "intelliSenseMode": "gcc-x64",
        "configurationProvider": "ms-vscode.cmake-tools" // this line
    }
],
```

## Files

-   `CMakeLists.txt`: This is the main file that is responsible to download and link the libtorch to your source files, add your project header files and source files in this, or you can create another `CMakeLists.txt` for your `src` folder and include that in this root `CMakeLists.txt`
