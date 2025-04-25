#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}🛠️  Configuração do Servidor Minecraft${NC}"
PS3="$(echo -e ${GREEN}Digite o número da opção: ${NC})"

select SERVER_TYPE in "Paper" "Vanilla" "Purpur" "Fabric" "Sair"; do
  case $SERVER_TYPE in
    "Sair") 
      echo "Até logo!" 
      exit 0
      ;;
    *)
      echo -e "\n${GREEN}Tipo selecionado: ${YELLOW}$SERVER_TYPE${NC}"
      break
      ;;
  esac
done

echo -e "\n${YELLOW}🔍 Buscando versões disponíveis...${NC}"
VERSIONS=$(curl -s https://api.papermc.io/v2/projects/paper | jq -r '.versions[]' | tac)

select MC_VERSION in $VERSIONS "Voltar" "Sair"; do
  case $MC_VERSION in
    "Voltar")
      exec "$0"
      ;;
    "Sair")
      exit 0
      ;;
    *)
      echo -e "\n${GREEN}Versão selecionada: ${YELLOW}$MC_VERSION${NC}"
      break
      ;;
  esac
done

echo -e "\n${GREEN}✅ Configuração completa!"
echo -e "Tipo: ${YELLOW}$SERVER_TYPE${GREEN}"
echo -e "Versão: ${YELLOW}$MC_VERSION${NC}\n"

export SERVER_TYPE MC_VERSION
#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}🛠️  Configuração do Servidor Minecraft${NC}"
PS3="$(echo -e ${GREEN}Digite o número da opção: ${NC})"

select SERVER_TYPE in "Paper" "Vanilla" "Purpur" "Fabric" "Sair"; do
  case $SERVER_TYPE in
    "Sair") 
      echo "Até logo!" 
      exit 0
      ;;
    *)
      echo -e "\n${GREEN}Tipo selecionado: ${YELLOW}$SERVER_TYPE${NC}"
      break
      ;;
  esac
done

echo -e "\n${YELLOW}🔍 Buscando versões disponíveis...${NC}"
VERSIONS=$(curl -s https://api.papermc.io/v2/projects/paper | jq -r '.versions[]' | tac)

select MC_VERSION in $VERSIONS "Voltar" "Sair"; do
  case $MC_VERSION in
    "Voltar")
      exec "$0"
      ;;
    "Sair")
      exit 0
      ;;
    *)
      echo -e "\n${GREEN}Versão selecionada: ${YELLOW}$MC_VERSION${NC}"
      break
      ;;
  esac
done

echo -e "\n${GREEN}✅ Configuração completa!"
echo -e "Tipo: ${YELLOW}$SERVER_TYPE${GREEN}"
echo -e "Versão: ${YELLOW}$MC_VERSION${NC}\n"

export SERVER_TYPE MC_VERSION
