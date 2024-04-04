#!/bin/sh

set -eu

cd ../codigo-fonte/cliente
npm install -g bower
bower install --allow-root
npm set strict-ssl false
npm install jasmine-core --save-dev
npm install
npm run build

cd dist
tar zcvf dist.tar.gz *
mv dist.tar.gz ../../../docker/nginx

cd ../../../docker/nginx
chmod -R a+x *.sh
