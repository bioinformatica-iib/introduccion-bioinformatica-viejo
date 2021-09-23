RED='\033[0;31m'
NC='\033[0m'


echo -e "${RED} INSTALANDO R...${NC}\n\n "

sudo apt-get update
sudo apt -y install r-base

echo -e "${RED} INSTALANDO Rstudio...${NC}\n\n "

sudo rm -f  rstudio*.deb 




sudo apt-get install -y libjpeg62-dev
sudo apt-get install -y libgit2-dev
wget http://fr.archive.ubuntu.com/ubuntu/pool/universe/g/gstreamer0.10/libgstreamer0.10-0_0.10.36-1.5ubuntu1_i386.deb
wget http://archive.ubuntu.com/ubuntu/pool/universe/g/gst-plugins-base0.10/libgstreamer-plugins-base0.10-0_0.10.36-2_i386.deb
sudo dpkg -i libgstreamer0.10-0_0.10.36-1.5ubuntu1_i386.deb
sudo dpkg -i libgstreamer-plugins-base0.10-0_0.10.36-2_i386.deb
sudo apt-mark hold libgstreamer-plugins-base0.10-0
sudo apt-mark hold libgstreamer0.10
wget http://download1.rstudio.org/rstudio-1.1.463-i386.deb

sudo dpkg -i rstudio*.deb 

sudo apt-get -f -y install 

echo -e "${RED} INSTALANDO paquetes...${NC}\n\n "


sudo apt-get -y install libcurl4-openssl-dev
sudo apt-get -y install libssl-dev
sudo apt-get -y install libxml2-dev



sudo Rscript -e 'install.packages("ggplot2", repos="https://cloud.r-project.org")'
sudo Rscript -e 'install.packages("nplr", repos="https://cloud.r-project.org")'
sudo Rscript -e 'install.packages("cluster", repos="https://cloud.r-project.org")'
sudo Rscript -e 'install.packages("lattice", repos="https://cloud.r-project.org")'
sudo Rscript -e 'install.packages("pheatmap", repos="https://cloud.r-project.org")'
sudo Rscript -e 'install.packages("devtools", repos="https://cloud.r-project.org")'
#Esto hay que hacerlo porque algunas dependencias de heatmaply requieren un R mayor y por ende hay qeu instalar versiones viejas:
sudo Rscript -e 'devtools::install_version("TSP",version = "1.1-8", repos="https://cloud.r-project.org")'
sudo Rscript -e 'devtools::install_version("caTools",version = "1.17", repos="https://cloud.r-project.org")'
sudo Rscript -e 'install.packages("heatmaply", repos="https://cloud.r-project.org")'
sudo Rscript -e 'devtools::install_github("vqv/ggbiplot")'

echo -e "${RED}Disfruta del TP :D${NC}\n\n "
