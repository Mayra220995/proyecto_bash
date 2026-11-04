#!/bin/bash
# Módulo 3: Análisis de Información
# Autor:Mayra Alexandra Peña Garcia

DIR_PROYECTO="/home/mpenage/proyecto_bash"
DATOS="$DIR_PROYECTO/servidores.txt"
COPIA="$DIR_PROYECTO/servidores_copia.txt"

# 1. Crear archivo con datos ficticios de servidores
cat << 'EOF' > "$DATOS"
servidor1 45%
servidor2 85%
servidor3 60%
servidor4 92%
servidor5 75%
EOF

echo "------------------------------------------"
echo "       ANALISIS DE DATOS - MODULO 3"
echo "-------------------------------------------"
echo ""
echo "--- DATOS ORIGINALES ---"
cat "$DATOS"
echo ""

# 2. Uso de AWK: servidores 70%
echo "--- ALERTA: Servidores con disco > 70% (usando awk) ---"
awk '{
    sub(/%/, "", $2); 
    if ($2 > 70) print "ALERTA -> " $1 " tiene un uso del " $2 "%"
}' "$DATOS"
echo ""

# 3. Uso de SED: para reemplazar palabras d euna copia
echo "--- CREANDO COPIA Y REEMPLAZANDO TEXTO (usando sed) ---"
cp "$DATOS" "$COPIA"
sed -i 's/servidor/nodo_servidor/g' "$COPIA"

echo "Copia modificada guardada en: $COPIA"
cat "$COPIA"
