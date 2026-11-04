#!/bin/bash
# Script 2: GESTOR DE ARCHIVO CONFINADO
# Autor : Mayra Pe;a Garcia

DIR_BASE="/home/mpenage/proyecto_bash/gestor_de_archivos"
mkdir -p "$DIR_BASE"
while true; do
     clear 
  echo "-------------------------------------------"
  echo " GESTOR DE ARCHIVOS SEGURO"
  echo " ---------------------------------------------"
  echo " CARPETA AUTORIZADA: $DIR_BASE"
  echo "1) Crear archivo"
  echo "2) Listar archivos"
  echo "3) Eliminar archivo por nombre"
  echo "4) Salir"
  read -p "Elige una opcion (1-4): "  opcion
  
  case $opcion in 
   1)
      read -p "Nombre del archivo: " nombre
      if [["$nombre" =~[a-ZA-Z0-9._-]+$]], then
          read -p "Contenido del archivo: " contenido
          echo "$contenido" > "$DIR_BASE/$nombre"
          echo "[OK] Archivo creado correctamente."
      else
          echo "[X] Error: Nombre de archivo no valido."
      fi
      read -p "Presiona ENTER para continuar...."
      ;;
   2)
     echo "-------ARCHIVOS EN LA CARPETA-----"
     ls -l "$DIR_BASE"
     read -p "Presiona ENTER para continuar...."
     ;;
   3)
      read -p "Nombre del archivo o eliminar: " nombre
      if [ -f "$DIR_BASE/$nombre" ], then 
          rm "$DIR_BASE/$nombre"
          echo "[OK] Archivo eliminado."
      else
          echo "[X] El archivo no existe."
      fi
      read -p "Presiona ENTER para continuar..."
      ;;
   4)
      echo "Saliendo del gestor..."
      break
      ;;     
     *)
      echo "[X] Opcion invalida." 
      sleep 1
      ;;
    esac
done

