#!/bin/bash

#   Copyright 2016 Yuki KAN
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

usage() {
  cat <<EOF

Usage:
rivarun [--b25] [--mirakurun host:port] [--priority priority] [--sid SID] [--ch type/channel] rectime destfile

Remarks:
* if rectime  is \`-\`, records indefinitely.
* if destfile is \`-\`, stdout is used for output.
* if \`--sid\` option specified, will ignore \`--ch\` option.

Options:
--b25:                 Send decode request
--mirakurun host:port: Specify Mirakurun hostname and portnumber
--priority priority:   Specify client priority (default=0)
--sid SID:             Specify SID number
--ch type/channel      Specify channeltype and channel
                         type = GR | BS | CS | SKY
--help:                Show this help
--version:             Show version
--list:                Show channel list

EOF

  return 0
}

SERVER="--unix-socket /var/run/mirakurun.sock http:/api"
DECODE="0"
PRIORITY="0"
SERVICE=""
CHANNEL=""

for OPT in "$@"
  do
    case "$OPT" in
      "--b25" )
        DECODE="1"
        shift 1
        ;;
      "--mirakurun" )
        if [[ -s "$2" ]] || [[ "$2" =~ ^-+ ]]; then
          echo "missing required args $1" 1>&2
          exit 1
        fi
        SERVER="http://${2}/api"
        shift 2
        ;;
      "--priority" )
        if [[ -s "$2" ]] || [[ "$2" =~ ^-+ ]]; then
          echo "missing required args $1" 1>&2
          exit 1
        fi
        PRIORITY="$2"
        shift 2
        ;;
      "--sid" )
        if [[ -s "$2" ]] || [[ "$2" =~ ^-+ ]]; then
          echo "missing required args $1" 1>&2
          exit 1
        fi
        SERVICE="$2"
        shift 2
        ;;
      "--ch" )
        if [[ -s "$2" ]] || [[ "$2" =~ ^-+ ]]; then
          echo "missing required args $1" 1>&2
          exit 1
        fi
        CHANNEL="$2"
        shift 2
        ;;
      "--help" )
        usage
        exit 1
        ;;
      "--version" )
        npm ls -g rivarun
        exit 1
        ;;
      "--list" )
        curl ${SERVER}/channels
        exit 1
        ;;
    esac
  done

if [[ ! "$2" ]]; then
  usage
  exit 1
fi

RECTIME=$1
DESTFILE=$2

OPTIONS="-v --fail -s -S"

if [[ "$RECTIME" != "-" ]]; then
  OPTIONS="$OPTIONS --max-time $RECTIME"
fi

if [[ "$DESTFILE" != "-" ]]; then
  OPTIONS="$OPTIONS -o $DESTFILE"
fi

URL=""

if [[ "$SERVICE" ]] && [[ "$SERVICE" != "epg" ]]; then
  URL="${URL}${SERVER}/services/${SERVICE}/stream"
else
  URL="${URL}${SERVER}/channels${CHANNEL}/stream"
fi

URL="${URL}?decode=${DECODE}"

curl $OPTIONS -A "Rivarun/1.0" -H "X-Mirakurun-Priority: ${PRIORITY}" $URL 

















