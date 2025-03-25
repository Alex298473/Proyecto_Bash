#!/bin/bash

while true; do
    clear
    echo "1) Crear usuarios y permisos"
    echo "2) Generar y analizar logs"
    echo "3) Crear backup (simulado)"
    echo "4) Mostrar espacio en disco"
    echo "5) Limpiar archivos temporales"
    echo "6) Salir"
    read -p "Seleccione una opción: " opcion

    case $opcion in
        1) bash scripts/usuarios.sh ;;
        2) bash scripts/logs.sh ;;
        3) echo "Backup no implementado aún" ;;
        4) df -h ;;
        5) echo "Limpieza no implementada aún" ;;
        6) exit 0 ;;
        *) echo "Opción inválida" ;;
    esac

    read -p "Presione Enter para continuar..."
done
