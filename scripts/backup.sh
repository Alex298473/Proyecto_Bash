#!/bin/bash

# Función para registrar acciones en actividad.log
log_actividad() {
  echo "$(date) - $1" >> logs/actividad.log
}

BACKUP_DIR="respaldo"
TAR_FILE="$BACKUP_DIR/backup_$(date +%Y%m%d_%H%M%S).tar.gz"

# Crear directorio de respaldo si no existe
mkdir -p $BACKUP_DIR
log_actividad "Directorio de respaldo $BACKUP_DIR creado (si no existía)."

# Realizar el backup
tar -czf $TAR_FILE /tmp/empresa/
log_actividad "Backup guardado en $TAR_FILE."

# Exportar información sobre el backup a un archivo de texto
INFORME_FILE="informes/backup_$(date +%Y%m%d_%H%M%S).txt"
echo "Backup realizado con éxito." > $INFORME_FILE
echo "Directorio respaldado: /tmp/empresa/" >> $INFORME_FILE
echo "Archivo de backup guardado en: $TAR_FILE" >> $INFORME_FILE
log_actividad "Informe del backup exportado a $INFORME_FILE."

echo "Backup guardado en $TAR_FILE"

