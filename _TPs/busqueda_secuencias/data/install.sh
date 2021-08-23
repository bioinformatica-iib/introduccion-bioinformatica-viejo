RED='\033[0;31m'
NC='\033[0m'

echo -e "${RED} INSTALANDO DEPENDENCIAS...${NC}\n\n "
sudo apt-get install -y ncbi-blast+-legacy make gcc g++ pkg-config

echo -e "${RED} Descargando FASTA ...${NC} \n\n"
git clone https://github.com/wrpearson/fasta36.git

echo -e "${RED} Instalando FASTA ... {$NC} \n\n "
mv fasta36 ~/Tools
cd ~/Tools
cd fasta36/src
make -f ../make/Makefile.linux32_sse2 all
sudo ln -s ~/Tools/fasta36/bin/fasta36 /bin/fasta

echo -e "${RED} Descargando la base de datos Swissprot...${NC}\n\n"
wget "https://drive.google.com/file/d/1DP3oPLPwQ5lUMm1fYZOJ7S3Tt-E3EYi-/view?usp=sharing" -O ~/swissprot_db.tar.gz
tar -C ~/ -xzvf ~/swissprot_db.tar.gz 

echo -e "${RED}LA BASE DE DATOS SWISSPROT SE HA DESCARGADO EN EN EL DIRECTORIO ${NC} ${HOME} \n\n"

echo -e "Disfruta del TP :D \n"
