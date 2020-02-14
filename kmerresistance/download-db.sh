#!/usr/bin/env bash

echo "Downloading ResFinder database to ${RESFINDER_DB}..."

cd ${RESFINDER_DB}
wget https://bitbucket.org/genomicepidemiology/resfinder_db/get/2a8dd7fc7a8c.zip

tar -xvf 2a8dd7fc7a8c.zip --strip-components 1
rm *.zip
python INSTALL.py

echo "ResFinder database is downloaded."

exit 0
