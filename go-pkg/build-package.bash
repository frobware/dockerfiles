#!/bin/bash

set -o errtrace
set -o errexit
set -o nounset

TOP_DIR=$(cd $(dirname "$0") && pwd)
source $TOP_DIR/meta.sh

priority=$(${TOP_DIR}/alternatives-priority $GO_VERSION)

cat <<EOF > $TOP_DIR/after-install.bash
#!/bin/bash
EOF
for i in $INSTALL_PREFIX/$GO_VERSION/bin/*; do
    fname=$(basename $i)
    echo "update-alternatives --install /usr/bin/$fname $fname ${INSTALL_PREFIX}/${GO_VERSION}/bin/$fname $priority" >> $TOP_DIR/after-install.bash
done

cat <<EOF > $TOP_DIR/after-remove.bash
#!/bin/bash
EOF
for i in $INSTALL_PREFIX/$GO_VERSION/bin/*; do
    fname=$(basename $i)
    echo "update-alternatives --remove $fname /usr/bin/$fname" >> $TOP_DIR/after-remove.bash
done

chmod 755 $TOP_DIR/after-install.bash
chmod 755 $TOP_DIR/after-remove.bash

cat $TOP_DIR/after-install.bash
cat $TOP_DIR/after-remove.bash

for i in deb; do
    fpm -f --prefix=${INSTALL_PREFIX}/${GO_VERSION} \
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
    -C ${INSTALL_PREFIX}/${GO_VERSION} \
    --name "${GO_VERSION}" \
    --version 1.0.0 \
    --description "Go ${GO_VERSION}" \
    --iteration $PKG_ITERATION bin src pkg doc test