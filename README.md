# Pear: The Best AI-Powered Code Editor

Speed up your development with an editor integrated with AI. PearAI is forked from VSCode, and aims to reduce the time from ideation to conception for your product development by achieving the most seamless integration with AI. By developers, for developers.

This repository serves as the primary application for PearAI, with most functionalities housed within the extension/pearai folder. We recommend focusing your work within this submodule by cloning it from https://github.com/trypear/pearai-app/.

To download the full product visit our homepage at https://trypear.ai.

# Prerequisites

PearAI currently only supports OpenAI at this time. To obtain an OpenAI API key go to [platform.openai.com/account/api-keys](https://platform.openai.com/account/api-keys).

## Features
* **Knows your code** - Pear has context on your database so you can ask questions about your code.
* **Auto-implement features** - Ask for a feature and receive a PR implementing it.
* **UI/UX focused** - Pear puts the user experience first, making developing as seamless as possible.
* **Never start from scratch** - Pear comes with high-quality templates and boilerplate code for any type of project.
* **Batteries included** - Pear comes fully setup with shortcuts and terminal plugins used to supercharge development productivity.
* **Familiar feel** - Pear is a fork of VSCode, so you can pick up exactly where you left off.

## Roadmap

Our [Master Document Roadmap](https://docs.google.com/document/d/14jusGNbGRPT8X6GgEDbP1iab5q4X7_y-eFXK7Ky57IQ/edit) contains the Pear AI roadmap, focusing on the teams development journey, and the community that surrounds Pear AI.

## Contributing

Read our to learn about our development process, how to propose bugfixes and improvements, and how to build and test your changes.

We welcome contributions from the community! Whether you're fixing a bug, improving the documentation, or adding a new feature, we appreciate your help in making PearAI better. To help you get your feet wet and become familiar with our contribution process, we have a list of [good first issues](https://github.com/trypear/pearai-app/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22) that contains things with a relatively limited scope. This is a great place to get started!


Please review our [Contributing Guide](CONTRIBUTING.md) to get started.


### Known or Common Errors
Below describes a set of known or common errors that can occur when developing with PearAI and the steps that can resolve such issues.

#### No main.js found
The following issue can occur after the build process.
```
[Error: ENOENT: no such file or directory, open '/pearai/out/vs/code/electron-main/main.js'] {
  errno: -2,
  code: 'ENOENT',
  syscall: 'open',
  path: '/code/pearai/out/vs/code/electron-main/main.js',
  phase: 'loading',
  moduleId: 'vs/code/electron-main/main',
  neededBy: [ '===anonymous1===' ]
}
```
To resolve this, follow the below steps:
 1. Remove the build `rm -rf out`
 2. Re-run the app: `./scripts/code.sh`
 3. If this persists please reach out via the communication channels listed in the [Contact](#contact) section

## License
Pear is licensed under the Pear Enterprise Edition (EE) license (the “EE License”). See the LICENSE file for details.

## Contact
For any questions or issues, please open an issue or reach out in the PearAI [Discord](https://discord.gg/7QMraJUsQt).

## Acknowledgements

Thanks to these wonderful people who have contributed to this project:
- [Nang](https://github.com/nang-dev)
- [FryingPannnn](https://github.com/Fryingpannn)
- [ItWasEnder](https://github.com/ItWasEnder)
- [Gedeondoescode](https://github.com/gedeondoescode)
- [Jwhitt3r](https://github.com/jwhitt3r)

Feel free to join them and contribute!

