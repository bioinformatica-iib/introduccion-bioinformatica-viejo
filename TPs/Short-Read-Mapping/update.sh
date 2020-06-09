#Install Updates and Required Packages
sudo apt-get update;
sudo apt-get install gcc;
sudo apt-get install make;
sudo apt-get install libbz2-dev;
sudo apt-get install zlib1g-dev;
sudo apt-get install libncurses5-dev;
sudo apt-get install libncursesw5-dev;
sudo apt-get install liblzma-dev;
# Install HTSLIB
cd /usr/bin
sudo wget https://github.com/samtools/htslib/releases/download/1.9/htslib-1.9.tar.bz2
sudo tar -vxjf htslib-1.9.tar.bz2
cd htslib-1.9
sudo make
# Install SAMTOOLS
cd ..
sudo wget https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2
sudo tar -vxjf samtools-1.9.tar.bz2
cd samtools-1.9
sudo make
# Install BCFTools
cd ..
sudo wget https://github.com/samtools/bcftools/releases/download/1.9/bcftools-1.9.tar.bz2
sudo tar -vxjf bcftools-1.9.tar.bz2
cd bcftools-1.9
sudo make
# Export To Path And Refresh
echo "export PATH=\$PATH:/usr/bin/bcftools-1.9" >> ~/.bashrc
echo "export PATH=\$PATH:/usr/bin/samtools-1.9" >> ~/.bashrc
echo "export PATH=\$PATH:/usr/bin/htslib-1.9" >> ~/.bashrc