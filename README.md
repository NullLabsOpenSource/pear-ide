# Pear: The Best AI-Powered Code Editor

Supercharge your development in an editor designed for less coding, with AI. This repository is a fork of VSCode.

This is the main app for PearAI. The bulk of the functionality is within `extension/pearai`. We recommend simply working within that submodule, by cloning https://github.com/trypear/pearai-extension/.

## Contributing

There are many ways in which you can participate in this project, for example:

If you are interested in fixing issues and contributing directly to the code base,
please see the document [How to Contribute](https://github.com/trypear/pearai/wiki/How-to-Contribute), which covers the following:
* [How to build and run from source](CONTRIBUTING.md)

You can also:
* [Submit bugs and feature requests](https://github.com/trypear/pearai/issues), and help us verify as they are checked in
* Review [source code changes](https://github.com/trypear/pearai/pulls)
* Review the [documentation](https://github.com/trypear/pearai-docs) and make pull requests for anything from typos to additional and new content

### Common errors

#### No main.js found
```
[Error: ENOENT: no such file or directory, open 'fryingpan/pearai/out/vs/code/electron-main/main.js'] {
  errno: -2,
  code: 'ENOENT',
  syscall: 'open',
  path: 'fryingpan/code/pearai/out/vs/code/electron-main/main.js',
  phase: 'loading',
  moduleId: 'vs/code/electron-main/main',
  neededBy: [ '===anonymous1===' ]
}
```
- Remove the build and re-ran script `rm -rf out`
- `./scripts/code.sh`

### node-gyp Build Errors
- Open Visual Studio Installer
- Ensure you have the following selected
  - [x] Desktop development with C++
  - [x] (IC) C++ v14.39 (17.9) MFC for v143 build tools with Spectre Mitigations (x86 & x64)
  - [x] (IC) MSVC v143 - VS 2022 C++ x64/x86 Spectre-mitigated libs (v14.39-17.9)

*\*IC defined as "Individual comonents" tab.*
*If having issue finding individual libraries add `spectre` to the search bar.*
