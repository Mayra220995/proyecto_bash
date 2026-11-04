#!/bin/bash
# Script Principal del Proyecto de Ciberseguridad
# Autora: Mayra Peña Garcia

while true; do
    clear
    echo "--------------------------------------------"
    echo "       SISTEMA DE ADMINISTRACION"
    echo "---------------------------------------------"
    echo "1) Ir al Gestor de Archivos"
    echo "2) Generar Analisis de Sistema"
    echo "3) Salir"
    read -p "Seleccione una opcion (1-3): " opcion

    case $opcion in
        1)
            bash /home/mpenage/proyecto_bash/scripts/gestor.sh
            ;;
        2)
            bash /home/mpenage/proyecto_bash/scripts/analisis.sh
            ;;
        3)
            echo "Saliendo del sistema..."
            exit 0
            ;;
        *)
            echo "Opcion invalida."
            sleep 1
            ;;
    esac
done
