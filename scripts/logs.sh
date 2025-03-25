#!/bin/bash

LOG_FILE="logs/eventos.log"

# Generar 30 eventos de log
for i in {1..30}; do
    echo "$(date) - EVENTO $i - $(shuf -n1 -e INFO WARNING ERROR LOGIN BACKUP)" >> $LOG_FILE
done

echo "Logs generados en $LOG_FILE"

# Análisis de logs
echo "Número de errores: $(grep -c 'ERROR' $LOG_FILE)"
echo "Últimos 5 errores:"
grep 'ERROR' $LOG_FILE | tail -n 5
