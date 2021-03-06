# Rivarun
A Simple [Mirakurun](https://github.com/kanreisa/Mirakurun) Client Implementation like recpt1.

tested on **[Chinachu](https://chinachu.moe/)** (beta). (Note: This is **NOT** for Chinachu Air.)

[![npm version][npm-img]][npm-url]

## Install

```
sudo npm install rivarun -g
```

### Uninstall

```
sudo npm uninstall rivarun -g
```

## CLI

#### Usage

```
rivarun [--b25] [--mirakurun host] [--priority priority] [--sid SID] [--ch type/channel] rectime destfile
```

#### Remarks

* if rectime  is `-`, records indefinitely.
* if destfile is `-`, stdout is used for output.

#### Options

```
--b25:               Send decode request
--mirakurun host:    Specify Mirakurun hostname and portnumber
--priority priority: Specify client priority (default=0)
--sid SID:           Specify SID number
--ch type/channel    Specify channeltype and channel
                       type = GR | BS | CS | SKY
--help:              Show this help
--version:           Show version
--list:              Show channel list
```

## Slack Community

* Join: https://slack.chinachu.moe/
* Login: https://chinachu.slack.com/

## License

[Apache License, Version 2.0](LICENSE)

[npm-img]: https://img.shields.io/npm/v/rivarun.svg
[npm-url]: https://npmjs.org/package/rivarun
