#!/bin/bash

set -o errtrace
set -o errexit
set -o nounset

TOP_DIR=$(cd $(dirname "$0") && pwd)
source $TOP_DIR/meta.sh

cat <<EOF > $TOP_DIR/after-install.bash
#!/bin/bash
EOF
for i in $TOP_DIR/go/bin/*; do
    fname=$(basename $i)
    echo "update-alternatives --install ${INSTALL_PREFIX}/bin/$fname $fname $GOROOT_FINAL/bin/$fname 100" >> $TOP_DIR/after-install.bash
done

cat <<EOF > $TOP_DIR/after-remove.bash
#!/bin/bash
EOF
for i in $TOP_DIR/gi/bin/*; do
    echo "update-alternatives --remove $fname ${INSTALL_PREFIX}/bin/$fname" >> $TOP_DIR/after-remove.bash
done

chmod 755 $TOP_DIR/after-install.bash
chmod 755 $TOP_DIR/after-remove.bash

for i in deb; do
    fpm -f --prefix=$GOROOT_FINAL \
	-s dir \
	-t $i \
	-C ${INSTALL_PREFIX}/${GO_VERSION} \
	--name "${GO_VERSION}" \
	--version 1.0.0 \
	--description "Go ${GO_VERSION}" \
	--after-install $TOP_DIR/after-install.bash \
	--after-remove $TOP_DIR/after-remove.bash \
	--iteration $PKG_ITERATION bin src pkg doc test
done

fpm -f --prefix=$GO_VERSION \
    -s dir \
    -t tar \
    -C ${GO_VERSION} \
    --name "${GO_VERSION}" \
    --version 1.0.0 \
    --description "Go ${GO_VERSION}" \
    --iteration $PKG_ITERATION bin src pkg doc test
