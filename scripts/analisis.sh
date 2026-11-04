#!/bin/bash
# Script 3: Analisis del Sistema y Generacion de Reportes
# Autora: Mayra Peña Garcia

DIR_REPORTES="/home/mpenage/proyecto_bash/reportes"
mkdir -p "$DIR_REPORTES"
FECHA=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIVO_REPORTE="$DIR_REPORTES/reporte_$FECHA.txt"

echo "--------------------------------------------"
echo "       ANALISIS Y ESTADO DEL SISTEMA"
echo "---------------------------------------------"
echo "Generando informe..."

{
    echo "-------------------------------------------"
    echo " REPORTE DE SISTEMA - $FECHA"
    echo " Autor: Mayra Peña Garcia"
    echo "----------------------------------------------"
    echo ""
    echo "--- ESPACIO EN DISCO ---"
    df -h /
    echo ""
    echo "--- USO DE MEMORIA RAM ---"
    free -h
    echo ""
    echo "--- PROCESOS ACTIVOS ---"
    ps aux | head -n 10
} > "$ARCHIVO_REPORTE"

echo "[OK] Reporte generado exitosamente en:"
echo "$ARCHIVO_REPORTE"
echo ""
read -p "Presiona ENTER para volver..."
