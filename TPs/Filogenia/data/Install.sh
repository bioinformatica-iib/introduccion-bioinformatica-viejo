RED='\033[0;31m'
NC='\033[0m'

echo -e "${RED} Instalando Phylip...${NC}\n\n "
sudo apt install embassy-phylip

echo -e "${RED} Descargando Dendroscope ...${NC} \n\n"
wget "https://software-ab.informatik.uni-tuebingen.de/download/dendroscope/Dendroscope_unix_3_7_2.sh" -O ~/Dendroscope_unix_3_7_2.sh

echo -e "${RED} Instalando Dendroscope...${NC}\n\n "
bash ~/Dendroscope_unix_3_7_2.sh
