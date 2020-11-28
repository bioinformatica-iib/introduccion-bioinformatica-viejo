RED='\033[0;31m'
NC='\033[0m'

echo -e "Tenes una VM de 32 o de 64 Bits? [ingresa '32' o '64', segun corresponda] \n\n"
read ARCH

echo -e "${RED} INSTALANDO DEPENDENCIAS...${NC}\n\n "
sudo apt-get install -y ncbi-blast+-legacy make gcc g++ pkg-config


echo -e "${RED} Descargando FASTA ...${NC} \n\n"
wget https://faculty.virginia.edu./wrpearson/fasta/fasta36/fasta-36.3.8h.tar.gz

echo -e "${RED} Instalando FASTA ... {$NC} \n\n "
mv fasta-36.3.8h.tar.gz ~/Tools
cd ~/Tools
tar -zxvf fasta-36.3.8h.tar.gz
cd fasta-36.3.8h/src
make -f ../make/Makefile.linux${ARCH}_sse2 fasta36
sudo ln -s ~/Tools/fasta-36.3.8h/bin/fasta36 /bin/fasta

#fasta -q ../seq/mgstm1.aa ../seq/prot_test.lseg

echo -e "${RED} Descargando la base de datos Swissprot...${NC}\n\n"
wget "https://www.dropbox.com/s/r2upggpdy502zx8/Swissprot_db.tar.gz?dl=1" -O ~/swissprot_db.tar.gz
tar -C ~/ -xzvf ~/swissprot_db.tar.gz 

echo -e "${RED}LA BASE DE DATOS SWISSPROT SE HA DESCARGADO EN EN EL DIRECTORIO ${NC} ${HOME} \n\n"

echo -e "Disfruta del TP :D \n"
