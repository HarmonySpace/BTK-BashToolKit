#!/bin/bash

# import a tool
yq_bin="$SERVICES_PATH/yq_linux_amd64"

# consult .yaml or .yml files
yq () {
  # yq "que" "donde"
  $yq_bin ${1} ${2}
}
