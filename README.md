# Rivarun
A Simple [Mirakurun](https://github.com/kanreisa/Mirakurun) Client Implementation like recpt1.

tested on **[Chinachu](https://chinachu.moe/)** (beta). (Note: This is **NOT** for Chinachu Air.)


## Requirements

* bash
* [curl](https://curl.haxx.se/) `>= 7.40`

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
* if `--sid` option specified, will ignore `--ch` option.

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