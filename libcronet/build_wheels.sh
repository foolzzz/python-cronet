#!/bin/bash

set -e

cd /app
mv /app/cronet_build /tmp
cp /tmp/cronet_build/libcronet*so /lib64
cp /tmp/cronet_build/include/*.h /usr/local/include

python3.8 -m build
auditwheel repair --plat manylinux_2_28_x86_64 dist/cronet-$VERSION-cp38-cp38-linux_x86_64.whl

python3.9 -m build
auditwheel repair --plat manylinux_2_28_x86_64 dist/cronet-$VERSION-cp39-cp39-linux_x86_64.whl

python3.10 -m build
auditwheel repair --plat manylinux_2_28_x86_64 dist/cronet-$VERSION-cp310-cp310-linux_x86_64.whl

python3.11 -m build
auditwheel repair --plat manylinux_2_28_x86_64 dist/cronet-$VERSION-cp311-cp311-linux_x86_64.whl

python3.12 -m build
auditwheel repair --plat manylinux_2_28_x86_64 dist/cronet-$VERSION-cp312-cp312-linux_x86_64.whl

mv /tmp/cronet_build /app