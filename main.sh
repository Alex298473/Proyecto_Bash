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
        1)
            bash scripts/usuarios.sh
            # Registro de acción
            echo "$(date) - Opción 1: Crear usuarios y permisos ejecutada." >> logs/actividad.log
            ;;
        2)
            bash scripts/logs.sh
            # Registro de acción
            echo "$(date) - Opción 2: Generar y analizar logs ejecutada." >> logs/actividad.log
            ;;
        3)
            bash scripts/backup.sh
            # Registro de acción
            echo "$(date) - Opción 3: Crear backup ejecutada." >> logs/actividad.log
            ;;
        4)
            df -h
            # Registro de acción
            echo "$(date) - Opción 4: Mostrar espacio en disco ejecutada." >> logs/actividad.log
            ;;
        5)
            bash scripts/limpieza.sh
            # Registro de acción
            echo "$(date) - Opción 5: Limpiar archivos temporales ejecutada." >> logs/actividad.log
            ;;
        6)
            echo "$(date) - Opción 6: Salir ejecutada." >> logs/actividad.log
            exit 0
            ;;
        *)
            echo "Opción inválida"
            echo "$(date) - Opción inválida seleccionada." >> logs/actividad.log
            ;;
    esac

    read -p "Presione Enter para continuar..."
done
