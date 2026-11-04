#!/bin/bash
# Módulo 1: Monitoreo del Sistema
# Autora: Mayra Alexandra Peña Garcia

DIR_REPORTES="/home/mpenage/proyecto_bash/reportes"
mkdir -p "$DIR_REPORTES"
REPORTE="$DIR_REPORTES/reporte_sistema.txt"

{
    echo "========================================================"
    echo "           REPORTE DE MONITOREO DEL SISTEMA"
    echo "========================================================"
    echo "Usuario actual : $(whoami)"
    echo "Fecha y hora   : $(date)"
    echo "--------------------------------------------------------"
    echo "Distribución Linux:"
    cat /etc/os-release | grep "PRETTY_NAME"
    echo "--------------------------------------------------------"
    echo "Espacio disponible en disco:"
    df -h /
    echo "========================================================"
} > "$REPORTE"

echo "[OK] Reporte generado con éxito."
cat "$REPORTE"
