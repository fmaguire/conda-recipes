#!/bin/bash
set -e

mkdir -p ${PREFIX}/bin

chmod +x resfinder.py
cp resfinder.py ${PREFIX}/bin/resfinder.py

# copy script to download database
chmod +x ${RECIPE_DIR}/download-db.sh
cp ${RECIPE_DIR}/download-db.sh ${PREFIX}/bin/download-db.sh

# Path for database
outdir=${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}-${PKG_BUILDNUM}
mkdir -p ${outdir}/database/
touch ${outdir}/database/.empty

# set RESFINDER_DB variable on env activation
mkdir -p ${PREFIX}/etc/conda/activate.d ${PREFIX}/etc/conda/deactivate.d
cat <<EOF >> ${PREFIX}/etc/conda/activate.d/resfinder.sh
export RESFINDER_DB=${outdir}/database/
EOF

cat <<EOF >> ${PREFIX}/etc/conda/deactivate.d/resfinder.sh
unset RESFINDER_DB
EOF
