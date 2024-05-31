#!/bin/bash

function actualizar_sistema() {
    clear
    echo "Actualizando el sistema..."
    sudo apt update && sudo apt -y full-upgrade && sudo apt -y autoremove && sudo apt clean
    sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches
    echo "Sistema actualizado."
    read -p "Presione [Enter] para continuar..."
}

function activar_bbr() {
    clear
    echo "Activando BBR..."
    sudo sysctl net.ipv4.tcp_congestion_control
    echo "net.ipv4.tcp_congestion_control=bbr" | sudo tee -a /etc/sysctl.conf
    sudo sysctl -p
    echo "BBR activado."
    read -p "Presione [Enter] para continuar..."
}

function cambiar_idioma_ubuntu() {
    clear
    echo "Cambiando idioma de Ubuntu a español..."
    sudo apt-get install language-pack-es -y
    sudo update-locale LANG=es_CO.UTF-8
    echo "Idioma cambiado, se requiere reiniciar."
    read -p "Presione [Enter] para continuar..."
    sudo reboot
}

function cambiar_zona_horaria() {
    clear
    echo "Cambiando zona horaria a America/Bogota..."
    sudo timedatectl set-timezone America/Bogota
    echo "Zona horaria cambiada."
    read -p "Presione [Enter] para continuar..."
}

function cerrar_puerto_rpc_111() {
    clear
    echo "Cerrando puerto RPC 111..."
    sudo systemctl disable --now rpcbind
    echo "Puerto RPC 111 cerrado."
    read -p "Presione [Enter] para continuar..."
}

function deshabilitar_firewalld_oracle() {
    clear
    echo "Deshabilitando FirewallD de Oracle..."
    sudo iptables -F && sudo iptables -X && sudo iptables -t nat -F && sudo iptables -t mangle -F
    sudo iptables -P INPUT ACCEPT && sudo iptables -P FORWARD ACCEPT && sudo iptables -P OUTPUT ACCEPT
    sudo iptables-save | sudo tee /etc/iptables/rules.v4
    echo "FirewallD deshabilitado."
    read -p "Presione [Enter] para continuar..."
}

function mirar_idioma_actual() {
    clear
    echo "Mirando idioma actual..."
    sudo cat /etc/default/locale
    read -p "Presione [Enter] para continuar..."
}

function mirar_puertos_activos() {
    clear
    echo "Mirando puertos activos..."
    if ! command -v netstat &> /dev/null; then
        echo "Instalando net-tools..."
        sudo apt install net-tools -y
    fi
    sudo netstat -tulpn | grep LISTEN
    read -p "Presione [Enter] para continuar..."
}

function reparar_log_lleno() {
    clear
    echo "Reparando log lleno..."
    sudo truncate -s 0 /var/log/syslog
    sudo du -sh /var/log/
    echo "Log reparado."
    read -p "Presione [Enter] para continuar..."
}

function mostrar_menu() {
    echo "Seleccione una opción:"
    echo "1) Actualizar el sistema"
    echo "2) Activar BBR"
    echo "3) Cambiar idioma Ubuntu"
    echo "4) Cambiar zona horaria"
    echo "5) Cerrar puerto RPC 111"
    echo "6) Deshabilitar FirewallD Oracle"
    echo "7) Mirar idioma actual"
    echo "8) Mirar puertos activos"
    echo "9) Reparar log lleno"
    echo "10) Salir"
}

while true; do
    clear
    mostrar_menu
    read -p "Ingrese una opción [1-10]: " opcion
    case $opcion in
        1) actualizar_sistema ;;
        2) activar_bbr ;;
        3) cambiar_idioma_ubuntu ;;
        4) cambiar_zona_horaria ;;
        5) cerrar_puerto_rpc_111 ;;
        6) deshabilitar_firewalld_oracle ;;
        7) mirar_idioma_actual ;;
        8) mirar_puertos_activos ;;
        9) reparar_log_lleno ;;
        10) echo "Saliendo..."; exit ;;
        *) echo "Opción inválida, por favor intente de nuevo." ;;
    esac
done

