#!/bin/bash

clear

# Função para listar as VPNs disponíveis
listar_vpns() {
  grep -i "^name" "$HOME"/.openfortigui/vpnprofiles/* | cut -d ":" -f "2" | cut -d "=" -f "2" | tr -d ' ' | sort | column -t
}

# Função para conectar a uma VPN específica
conectar_vpn() {
  # Substitua "openvpn" pelo comando correto para iniciar a sua VPN
  # openvpn --config ~/.openfortigui/vpnprofiles/$1.ovpn
  sudo -E /usr/bin/openfortigui --start-vpn --vpn-name "$1" --main-config "$HOME"/.openfortigui/main.conf &
}

# Iniciar a VPN
start_vpn() {
  # /usr/bin/openfortigui --start-vpn --vpn-name Vianense2 --main-config /home/suporte4/.openfortigui/main.conf &
  # Lista as VPNs disponíveis
  echo "VPNs disponíveis:"
listar_vpns

# Solicita ao usuário que escolha uma VPN
read -p "Digite o nome da VPN para conectar: " vpn_selecionada

# Verifica se a VPN existe (implementação básica)
if grep -q "^name=$vpn_selecionada" "$HOME"/.openfortigui/vpnprofiles/*; then
  conectar_vpn "$vpn_selecionada"
else
  echo "VPN não encontrada."
  sleep 5
  clear
fi
}

# Parar a VPN
stop_vpn() {
  # sudo -E /usr/bin/openfortigui --stop-vpn --vpn-name Vianense2
  sudo -E /usr/bin/openfortigui --kill-vpn-processes
  read -t 10
  clear
}

# Verificar o status
status_vpn() {
  ps aux | grep "openfortigui --start-vpn" | grep -v grep
  read -t 10
  clear
}

# Menu interativo (opcional)
while true; do
  echo "1. Iniciar VPN"
  echo "2. Parar VPN"
  echo "3. Verificar status"
  echo "4. Sair"
  read option

  case $option in
    1) start_vpn ;;
    2) stop_vpn ;;
    3) status_vpn ;;
    4) exit ;;
    *) echo "Opção inválida" ;;
  esac
done
