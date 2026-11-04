#!/bin/bash
# Módulo 2: Gestión de Archivos
# Autor: Mayra Alexandra Peña Garcia

crear_archivo() {
    read -p "Ingresa el nombre del archivo a crear: " nombre
    touch "$nombre"
    echo "[OK] Archivo '$nombre' creado con éxito."
}

copiar_archivo() {
    read -p "Ingresa el archivo origen: " origen
    if [ -f "$origen" ]; then
        read -p "Ingresa el nombre/ruta de destino: " destino
        cp "$origen" "$destino"
        echo "[OK] Archivo copiado con éxito."
    else
        echo "[ERROR] El archivo origen no existe."
    fi
}

cambiar_permisos() {
    read -p "Ingresa el nombre del archivo para asignar permiso 644: " archivo
    if [ -f "$archivo" ]; then
        chmod 644 "$archivo"
        echo "[OK] Permisos cambiados a 644 para '$archivo'."
        ls -l "$archivo"
    else
        echo "[ERROR] El archivo no existe."
    fi
}

eliminar_archivo() {
    read -p "Ingresa el archivo a eliminar: " archivo
    if [ -f "$archivo" ]; then
        read -p "¿Estás segura de eliminar '$archivo'? (s/n): " confirmacion
        if [ "$confirmacion" = "s" ] || [ "$confirmacion" = "S" ]; then
            rm "$archivo"
            echo "[OK] Archivo eliminado."
        else
            echo "Operación cancelada."
        fi
    else
        echo "[ERROR] El archivo no existe."
    fi
}

# Bucle principal (while y case)
opcion=0
while [ "$opcion" -ne 5 ]; do
    echo ""
    echo "-------------------------------------------"
    echo "       GESTION DE ARCHIVOS - MODULO 2"
    echo "--------------------------------------------"
    echo "1. Crear archivo"
    echo "2. Copiar archivo"
    echo "3. Cambiar permisos a 644"
    echo "4. Eliminar archivo (con confirmación)"
    echo "5. Salir"
    read -p "Selecciona una opción [1-5]: " opcion

    case $opcion in
        1) crear_archivo ;;
        2) copiar_archivo ;;
        3) cambiar_permisos ;;
        4) eliminar_archivo ;;
        5) echo "Saliendo del gestor..." ;;
        *) echo "Opción no válida." ;;
    esac
done
