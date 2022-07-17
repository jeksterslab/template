#! /usr/bin/bash

# https://cran.r-project.org/bin/linux/ubuntu/fullREADME.html

echo "deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/" | sudo tee -a /etc/apt/sources.list
sudo apt -y update && sudo apt -y upgrade
sudo apt install -y r-base
sudo apt install -y r-base-dev
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
echo "The fingerprint should be 298A3A825C0D65DFD57CBB651716619E084DAB9."
# etc
sudo apt install -y git
sudo apt install -y parallel
sudo apt install -y pandoc
sudo apt install -y libcurl4-openssl-dev
sudo apt install -y libssl-dev
sudo apt install -y libxml2-dev
sudo apt install -y libfontconfig1-dev
sudo apt install -y vim
