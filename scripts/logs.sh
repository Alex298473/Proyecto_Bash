#!/bin/bash

# Función para registrar acciones en actividad.log
log_actividad() {
  echo "$(date) - $1" >> logs/actividad.log
}

# Generar 30 eventos de log
LOG_FILE="logs/eventos_$(date +%Y%m%d_%H%M%S).log"
log_actividad "Generando 30 eventos de log y guardándolos en $LOG_FILE."
for i in {1..30}; do
    echo "$(date) - EVENTO $i - $(shuf -n1 -e INFO WARNING ERROR LOGIN BACKUP)" >> $LOG_FILE
done
log_actividad "Logs generados correctamente en $LOG_FILE."

# Análisis de logs
NUM_ERRORES=$(grep -c 'ERROR' $LOG_FILE)
ULTIMOS_ERRORES=$(grep 'ERROR' $LOG_FILE | tail -n 5)

# Mostrar y registrar el análisis
log_actividad "Número de errores: $NUM_ERRORES"
log_actividad "Últimos 5 errores: $ULTIMOS_ERRORES"

# Exportar el análisis a un archivo de texto
INFORME_FILE="informes/analisis_logs_$(date +%Y%m%d_%H%M%S).txt"
echo "Número de errores: $NUM_ERRORES" > $INFORME_FILE
echo "Últimos 5 errores:" >> $INFORME_FILE
echo "$ULTIMOS_ERRORES" >> $INFORME_FILE
log_actividad "Informe de análisis de logs exportado a $INFORME_FILE."

echo "Logs generados y analizados correctamente."
