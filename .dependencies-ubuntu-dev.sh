#! /usr/bin/bash

# https://cran.r-project.org/bin/linux/ubuntu/fullREADME.html

echo "deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/" | sudo tee -a /etc/apt/sources.list
sudo apt update && sudo apt upgrade
sudo apt install r-base
sudo apt install r-base-dev
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
echo "The fingerprint should be 298A3A825C0D65DFD57CBB651716619E084DAB9."
# etc
sudo apt install git
sudo apt install parallel
sudo apt install pandoc
sudo apt install libcurl4-openssl-dev
sudo apt install libssl-dev
sudo apt install libxml2-dev
sudo apt install libfontconfig1-dev
