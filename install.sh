#!/bin/bash

# Função para exibir o menu
menu() {
    clear
    echo "━━━━━━━"
    echo " MENU DE INSTALAÇÃO "
    echo "━━━━━━━"
    echo "[1] SSH-PRO"
    echo "[2] SSH-PRO BETA"
    echo "[3] CORRIGIR ERRO UPDATE"
    echo "[4] PAINEL DT"
    echo "[5] LIMPAR VPS"
    echo "[6] ALTERAR SENHA ROOT"
    echo "[7] OTIMIZAR VPS"
    echo "[0] Sair"
    echo "━━━━━━━"
    echo -n "Escolha uma opção: "
}

# Função para executar os comandos de acordo com a opção escolhida
executar_opcao() {
    case $1 in
        1) clear; bash <(curl -sL https://raw.githubusercontent.com/vmell0/pro/refs/heads/main/sshpro.sh) ;;
        2) clear; bash <(curl -s https://raw.githubusercontent.com/vmell0/RustyManager/refs/heads/main/install.sh) ;;
        3) clear; sudo apt remove speedtest-cli -y; sudo rm /etc/apt/sources.list.d/ookla_speedtest-cli.list ;;
        4) clear; apt update; apt upgrade -y; apt install wget -y; bash <(wget -qO- https://raw.githubusercontent.com/vmell0/pro/refs/heads/main/dtmod.sh) ;;
        5) clear; apt update -y && apt upgrade -y && apt autoremove -y && apt -f install -y && apt autoclean -y ;;
        6) clear; bash <(curl -sL https://raw.githubusercontent.com/xzlordzx/sshpro/refs/heads/main/senharoot.sh) ;;
        7) clear; bash <(curl -sL https://raw.githubusercontent.com/xzlordzx/sshpro/refs/heads/main/otimizar.sh) ;;
        0) echo "Saindo..."; exit 0 ;;
        *) echo "Opção inválida!";;
    esac
    read -p "Pressione Enter para voltar ao menu..."
}

# Loop do menu
while true; do
    menu
    read opcao
    executar_opcao $opcao
done
