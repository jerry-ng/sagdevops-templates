#!/bin/sh

sagcc exec templates composite import -i template.yaml overwrite=true --wait 30
sagcc exec templates composite apply sag-is-server nodes=local \
  is.memory.max=256 \
  repo.product=10-3_Products_Image_lnxamd64 \
  repo.fix=10-3_Latest_Fixes_Image_2020-06-21_lnxamd64 \
  --sync-job --wait 900
