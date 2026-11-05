Proyecto de Automatización y Administración en Shell Scripting
Proyecto desarrollado para la carrera de Administración de Ciberseguridad en IDAT.
Implementa la automatización de monitoreo de métricas, gestión interactiva de archivos y permisos, filtrado de métricas de servidores y administración del servicio CRON
Estructura del Proyecto:
*´scripts/´: Contiene los 4 módulos funcionales numerados en orden correlativo.
* `reportes/´: Almacena las salidas y logs generados automáticamente por los scripts.
* `servidores.txt´: Archivo de datos base para análisis de infraestructura.
* `servidores_copia.txt´: Archivo sobre el cual se realizan ediciones y filtrados.
 Módulos Funcionales
 01. Monitoreo del Sistema (`01.sistema.sh`)
* **Descripción:** Extrae métricas clave del equipo (usuario, fecha, versión de OS y espacio en disco). Salida: Genera un reporte automático en la carpeta `reportes/`.

02. Gestor Interactivo (`02.gestor.sh`)
* **Descripción:** Menú interactivo basado en bucles `while` y condicionales `case`. Funcionalidad:** Permite la creación y manipulación segura de archivos asignando permisos `644`.

03. Análisis y Filtrado (`03.analisis.sh`)
* **Descripción:** Procesa el archivo `servidores.txt` utilizando comandos `awk` y `sed`. Funcionalidad:** Filtra servidores que superan el 70% de consumo de almacenamiento para emitir alertas de estado crítico.

04. Automatización con Cron (`04.automatizacion.sh`)
* **Descripción:** Asistente guiado interactivo para gestionar el demonio `cron` del sistema. Funcionalidad:** Programación autónoma de tareas diarias, consulta de reglas activas en `crontab` y remoción limpia de tareas. 
