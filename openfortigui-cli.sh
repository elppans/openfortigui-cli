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
  /usr/bin/openfortigui --start-vpn --vpn-name "$1" --main-config "$HOME"/.openfortigui/main.conf &>>/tmp/"$1".log &
  echo "$1" > /tmp/openfortigui-cli_start.log
  clear
}

# Iniciar a VPN
start_vpn() {
  # /usr/bin/openfortigui --start-vpn --vpn-name Vianense2 --main-config /home/suporte4/.openfortigui/main.conf &
  # Lista as VPNs disponíveis
  echo "VPNs disponíveis:"
listar_vpns

# Solicita ao usuário que escolha uma VPN
read -p "Digite o nome da VPN para conectar: " vpn_selecionada
#clear

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

# Verificar o log online
log_vpn() {
  local lvpn
  lvpn="$(cat /tmp/openfortigui-cli_start.log)"
  echo "Acessando o log da ultima conexao iniciada..."
  echo -e "Para sair do log, aperte \"CTRL+C\" e depois \"q\""
  sleep 5
  tail -f /tmp/"$lvpn".log | less
  clear
}

# Menu interativo (opcional)
while true; do
  echo "1. Iniciar VPN"
  echo "2. Parar VPN"
  echo "3. Verificar status"
  echo "4. Verificar log online"
  echo "5. Sair"
  read option

  case $option in
    1) start_vpn ;;
    2) stop_vpn ;;
    3) status_vpn ;;
    4) log_vpn ;;
    5) exit ;;
    *) echo "Opção inválida" && sleep 2 && clear ;;
  esac
done
