#!/bin/bash

set -o errtrace
set -o errexit
set -o nounset

TOP_DIR=$(cd $(dirname "$0") && pwd)
source $TOP_DIR/meta.sh

cat <<EOF > $TOP_DIR/after-install.bash
#!/bin/bash
EOF
pushd $TOP_DIR/go/bin
for i in *; do
    echo "update-alternatives --install /usr/local/bin/$i $i $GOROOT_FINAL/bin/$i 100" >> $TOP_DIR/after-install.bash
done
popd

cat <<EOF > $TOP_DIR/after-remove.bash
#!/bin/bash
EOF
pushd $TOP_DIR/go/bin
for i in *; do
    echo "update-alternatives --remove $i /usr/local/bin/$i" >> $TOP_DIR/after-remove.bash
done
popd

chmod 755 $TOP_DIR/after-install.bash
chmod 755 $TOP_DIR/after-remove.bash

for i in tar deb; do
    fpm -f --prefix=$GOROOT_FINAL \
	-s dir \
	-t $i \
	-C go \
	--name "${GO_VERSION}" \
	--version 1.0.0 \
	--description "Go ${GO_VERSION}" \
	--after-install $TOP_DIR/after-install.bash \
	--after-remove $TOP_DIR/after-remove.bash \
	--iteration $PKG_ITERATION bin src pkg doc
done
