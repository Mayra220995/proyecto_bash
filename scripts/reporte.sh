#!/bin/bash
# script 1: Reporte del Sistema y Estado de Recursos
# Autor> Mayra Pe;a Garcia 

ARCHIVO_REPORTE="/home/mpenage/proyecto_bash/reportes/ultimo_reporte.txt"
FECA=$(date)
USUARIO=$(whoami)
HOST=$(hostname)

echo "============================="
echo "REPORTE DE ESTADO DE SERVIDOR "
echo"-------------------------------------"
{
     echo "-----------------------------------"
     echo "REPORTE DE ESTADO DEL SERVIDOR"
     echo  "---------------------------------------"
     echo "FECHA Y HORA:$FECHA"
     echo  "servidor: $HOST"
     echo ""
     echo "-----USO DE DISCO (RAIZ) ------"
     df /h / | tail -n 1
    echo ""
    echo " -------USO DE MEMORIA RAM---------"
    free -h
    echo ""
    echo " Estado: ANALISIS COMPLETADO EXITOSAMENTE"
    echo "----------------------------------------------"
} | tee "$ARCHIVO_REPORTE"
echo -e "\n[X+] Reporte guardadoexitosamente en : $ARCHIVO_RREPORTE"

