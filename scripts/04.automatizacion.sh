#!/bAin/bash

# Rutas del proyecto adaptadas a tu sistema
SCRIPT_SISTEMA="/home/mpenage/proyecto_bash/scripts/sistema.sh"
DIR_REPORTES="/home/mpenage/proyecto_bash/reportes"

while true; do
    echo "-----------------------------------------------------------"
    echo "MÓDULO 4: AUTOMATIZACIÓN Y ASISTENTE DE CRONTAB"
    echo "-----------------------------------------------------------"
    echo "1. Programar nueva tarea de monitoreo"
    echo "2. Ver estado y tareas activas en crontab"
    echo "3. Remover tarea de monitoreo de crontab"
    echo "4. Ejecutar monitoreo"
    echo "5. Salir"
    echo "-----------------------------------------------------------------"
    read -p "Seleccione una opción [1-5]: " opcion
    echo ""

    case $opcion in
        1)
            echo "--- PROGRAMAR TAREA ---"
            read -p "Ingrese la hora de ejecución (0-23) [ej. 08]: " hora
            read -p "Ingrese el minuto de ejecución (0-59) [ej. 30]: " min
            
            # Formatear la tarea de cron con etiqueta e identificador
            CRON_JOB="$min $hora * * * bash \"$SCRIPT_SISTEMA\" >> \"$DIR_REPORTES/reporte_\$(date +\%Y-\%m-\%d).txt\" 2>&1"
            
            # Evitar duplicados y agregar la tarea
            (crontab -l 2>/dev/null | grep -v "$SCRIPT_SISTEMA"; echo "# TAREA_MONITOREO_AUTOMATICO_SHELL"; echo "$CRON_JOB") | crontab -
            echo -e "\n[ÉXITO] Tarea programada correctamente para ejecutarse a las $hora:$min hrs daily.\n"
            ;;
            
        2)
            echo "--- ESTADO ACTUAL DE CRONTAB ---"
            if crontab -l 2>/dev/null | grep -q "$SCRIPT_SISTEMA"; then
                echo -e "[ÉXITO] $(date +'%Y-%m-%d %H:%M:%S') - La tarea de monitoreo del proyecto se encuentra ACTIVA:"
                crontab -l | grep -A 1 "TAREA_MONITOREO"
            else
                echo "[INFO] No se encontró la tarea de monitoreo activa en crontab."
            fi
            echo -e "\nTodas las tareas del usuario ($(whoami)):"
            crontab -l 2>/dev/null || echo "No hay tareas registradas."
            echo ""
            ;;
            
        3)
            echo "--- REMOVER TAREA ---"
            (crontab -l 2>/dev/null | grep -v "$SCRIPT_SISTEMA" | grep -v "TAREA_MONITOREO") | crontab -
            echo -e "[ÉXITO] Tarea de monitoreo removida de crontab correctamente.\n"
            ;;
            
        4)
            echo "--- EJECUTANDO SIMULACIÓN DE MONITOREO ---"
            bash "$SCRIPT_SISTEMA"
            echo -e "[ÉXITO] Monitoreo ejecutado manualmente. Reporte generado en $DIR_REPORTES.\n"
            ;;
            
        5)
            echo "Saliendo del asistente de automatización..."
            break
            ;;
            
        *)
            echo -e "[ERROR] Opción no válida. Intente de nuevo.\n"
            ;;
    esac
done
