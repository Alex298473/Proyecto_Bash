#!/bin/bash

# Función para registrar acciones en actividad.log
log_actividad() {
  echo "$(date) - $1" >> logs/actividad.log
}

# Eliminar archivos temporales de más de 7 días
find /tmp/empresa/ -type f -mtime +7 -exec rm {} \;
log_actividad "Archivos temporales de más de 7 días eliminados en /tmp/empresa/."

# Exportar información sobre los archivos eliminados a un archivo de texto
INFORME_FILE="informes/limpieza_$(date +%Y%m%d_%H%M%S).txt"
echo "Archivos temporales eliminados de más de 7 días en /tmp/empresa/" > $INFORME_FILE
echo "Operación realizada el: $(date)" >> $INFORME_FILE
log_actividad "Informe de limpieza exportado a $INFORME_FILE."

echo "Archivos temporales de más de 7 días eliminados."

