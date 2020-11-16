#!/bin/sh

sagcc exec templates composite import -i template.yaml overwrite=true --wait 30
sagcc exec templates composite apply sag-is-server nodes=local \
  is.instance.name=DEPLOYER \
  is.memory.init=256 \
  is.memory.max=256 \
  is.primary.port=5555 \
  is.diagnostic.port=9955 \
  is.jmx.port=8055 \
  is.package.list='WmBrokerDeployer, WmNUMDeployer, WmDeployer' \
  repo.product=10-3_Products_Image_lnxamd64 \
  repo.fix=10-3_Latest_Fixes_Image_2020-06-21_lnxamd64 \
  --sync-job --wait 900

sagcc exec templates composite apply sag-is-server nodes=local \
  is.instance.name=TEST \
  is.memory.init=256 \
  is.memory.max=256 \
  is.primary.port=5566 \
  is.diagnostic.port=9966 \
  is.jmx.port=8066 \
  is.package.list='WmServiceMock' \
  repo.product=10-3_Products_Image_lnxamd64 \
  repo.fix=10-3_Latest_Fixes_Image_2020-06-21_lnxamd64 \
  --sync-job --wait 900

sagcc exec templates composite apply sag-is-server nodes=local \
  is.instance.name=SIT \
  is.memory.init=256 \
  is.memory.max=256 \
  is.primary.port=5577 \
  is.diagnostic.port=9977 \
  is.jmx.port=8077 \
  is.package.list='WmJDBCAdapter' \
  repo.product=10-3_Products_Image_lnxamd64 \
  repo.fix=10-3_Latest_Fixes_Image_2020-06-21_lnxamd64 \
  --sync-job --wait 900
