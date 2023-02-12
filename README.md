# FlubifyMBR
A malicious little program that will overwrite the MBR of a hard drive with a custom bootloader, printing any text that you wish to be there! Made using C with the Win32 API, and the bootloader is written in x86 Assembly.

Works down to Windows XP, up to Windows 10.

## Usage
Obtain the `FlubifyMBR.exe` executable, either from the ["Releases"](https://github.com/bemxio/FlubifyMBR/releases) page, or by [compiling](https://github.com/bemxio/FlubifyMBR#compiling) it yourself. Then, just run the executable as an administrator, and the program will guide you through the rest.

## Compiling
Before compiling, make sure you have MinGW installed, either through installing it on Linux, or through [MSYS2](https://www.msys2.org/).

After that, simply run `make` in the root directory of the project. The executable will be in the `build` directory.

## Contributing
As with all my projects, contributions are highly appreciated!