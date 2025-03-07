#!/bin/bash

####################################################################################################
# Please ensure that Chromium or Chrome, VSCode and anaconda3 is installed on your system before running this script.
# The installed anaconda3 should be in the directory /home/user/anaconda3/.
# The dbt project jaffle_shop.zip should be uploaded to the home directory before running this script.
# This script is tested on Ubuntu 20.04 LTS.
####################################################################################################

mkdir -p ~/.dbt
mkdir -p ~/projects

source /home/user/anaconda3/etc/profile.d/conda.sh
conda activate dbt

echo "source /home/user/anaconda3/etc/profile.d/conda.sh" >> ~/.bashrc
echo "conda activate dbt" >> ~/.bashrc

cd /home/user/projects
mv /home/user/materialize_test.zip .
unzip -q materialize_test.zip
mv materialize_test/profiles.yml ~/.dbt/
rm -f materialize_test.zip

gnome-terminal --maximize --working-directory=/home/user/projects/materialize_test
code /home/user/projects/materialize_test --disable-workspace-trust
