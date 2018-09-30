<div align="center">

[![Logo](https://raw.githubusercontent.com/robin-rpr/node-gpu/master/misc/img/gone.export.png)](https://github.com/GONEproject/engine)

[![NPM][npm-image]][npm-url]
[![NPM Downloads][download-image]][download-url]
[![Known Vulnerabilities][snyc-image]][snyc-url]
[![Docker][docker-image]][docker-url]
[![IRC][IRC-image]][IRC-url]

#### GPU OPTIMIZED NODEJS ENGINE
</div>
<hr />

## Supported distros
| OS            | Version       | Status |
|:-------------:|:-------------:|:-------:|
| Ubuntu        | 14.04 LTS `(trusty)` <br/> 16.04 LTS `(xenial)` <br/> 17.10 `(artful)` <br/> 18.04 LTS `(bionic)`| complete |
| Debian        | 8 `(jessie)` or later | complete |
| CentOS        | N/A | not-started |
| Windows       | N/A | not-started |

## Installation

### Required Tools
On all platforms:
- Yarn for dependency management. Download can be found [here.](https://yarnpkg.com/en/docs/install)
- We use Git for version control (version 2.11.0 or later.)

On Linux:
- Required libraries: g++-6-arm-linux-gnueabihf, gcc-arm-linux-gnueabihf, gcc-arm-linux-gnueabihf, xserver-xorg-dev, libxext-dev, libxi-dev, libpci-dev

## Development Setup

### Getting the source
```bash
$ git clone --recurse-submodules -j8 https://github.com/GONEproject/engine.git
$ cd engine
$ yarn install
$ yarn run prebuild
```

### NPM
```
$ npm i gone --save
```

## License

  [BSD](./LICENSE)


[npm-image]: https://img.shields.io/npm/v/node-gpu.svg?longCache=true&style=flat-square
[npm-url]: https://www.npmjs.com/package/gone

[IRC-image]: https://img.shields.io/badge/IRC-%23GONEproject-lightgrey.svg?label=IRC&longCache=true&style=flat-square
[IRC-url]: https://webchat.freenode.net/?channels=GONEproject

[docker-image]: https://img.shields.io/badge/docker-goneproject/gone-3ca6ee.svg?logo=docker&label=Docker&longCache=true&style=flat-square
[docker-url]: https://webchat.freenode.net/?channels=GONEproject

[download-image]: https://img.shields.io/npm/dm/gone.svg?longCache=true&style=flat-square
[download-url]: https://www.npmjs.com/package/gone

[snyc-image]: https://snyk.io/test/github/robin-rpr/node-gpu/badge.svg?longCache=true&style=flat-square
[snyc-url]: https://snyk.io/test/github/GONEproject/engine
