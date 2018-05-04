#!/usr/bin/env bash

# the following has been taken from <https://misc.flogisoft.com/bash/tip_colors_and_formatting>
ALL_CLEAR='\e[0m'

CLR_RED='\e[31m'
CLR_GREEN='\e[32m'
CLR_YELLOW='\e[33m'
CLR_BLUE='\e[34m'
CLR_MAGENTA='\e[35m'
CLR_CYAN='\e[36m'
CLR_DEFAULT='\e[39m'
CLR_WHITE='\e[97m'
CLR_LIGHT_GRAY='\e[37m'
CLR_DARK_GRAY='\e[90m'
CLR_LIGHT_RED='\e[91m'
CLR_LIGHT_GREEN='\e[92m'
CLR_LIGHT_YELLOW='\e[93m'
CLR_LIGHT_BLUE='\e[94m'
CLR_LIGHT_MAGENTA='\e[95m'
CLR_LIGHT_CYAN='\e[96m'

STYLE_BOLD='\e[1m'
STYLE_DIM='\e[2m'
STYLE_UNDERLINE='\e[4m'
STYLE_BLINK='\e[5m'
STYLE_INVERSE='\e[7m'

log_none()
{
  echo "$(date +"%Y-%m-%d %T") [INFO] $1" >&2
}

log_debug()
{
  echo "$(date +"%Y-%m-%d %T") [DEBUG] $1" >&2
}

log_info()
{
  echo -e "$(date +"%Y-%m-%d %T") $CLR_CYAN[INFO]$ALL_CLEAR $@" >&2
}

log_error()
{
  echo -e "$(date +"%Y-%m-%d %T") $CLR_RED[ERROR]$ALL_CLEAR $@" >&2
}

log_warn()
{
  echo -e "$(date +"%Y-%m-%d %T") $CLR_YELLOW[WARN]$ALL_CLEAR $@" >&2
}

log_end()
{
  echo -e "$(date +"%Y-%m-%d %T") $CLR_MAGENTA[END]$ALL_CLEAR $@" >&2
}

log_end_time()
{
  log_end "Script took $SECONDS seconds to run [$(date -ud "@$SECONDS" +'%H:%M:%S')]"
}

check_file_exists()
{
  if [ ! -f "$1" ]; then
    log_error "File does not exist: $1"
    exit 1
  fi
}