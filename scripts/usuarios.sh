#!/bin/bash

# Función para registrar acciones en actividad.log
log_actividad() {
  echo "$(date) - $1" >> logs/actividad.log
}

# Crear grupos
log_actividad "Creando grupos administracion y tecnicos."
groupadd administracion
groupadd tecnicos
log_actividad "Grupos creados correctamente."

# Crear usuarios y asignarlos a grupos
log_actividad "Creando usuarios admin1, tecnico1, auditor1 y asignando a sus grupos."
useradd -m -G administracion admin1
useradd -m -G tecnicos tecnico1
useradd -m auditor1
log_actividad "Usuarios creados correctamente."

# Crear directorios
log_actividad "Creando directorios /tmp/empresa/admin, /tmp/empresa/tecnicos y /tmp/empresa/compartido."
mkdir -p /tmp/empresa/admin /tmp/empresa/tecnicos /tmp/empresa/compartido
log_actividad "Directorios creados correctamente."

# Aplicar permisos especiales
log_actividad "Aplicando permisos especiales: SetUID, SetGID, Sticky Bit."
chmod u+s /tmp/empresa/admin        # SetUID
chmod g+s /tmp/empresa/tecnicos     # SetGID
chmod +t /tmp/empresa/compartido    # Sticky Bit
log_actividad "Permisos especiales aplicados correctamente."

# Dar acceso a auditor1 con ACL
log_actividad "Asignando permisos ACL a auditor1 sobre /tmp/empresa/admin."
setfacl -m u:auditor1:r /tmp/empresa/admin
log_actividad "Permisos ACL asignados a auditor1."

# Crear archivos de información sobre los usuarios en la carpeta usuarios/
mkdir -p usuarios
log_actividad "Creando carpeta usuarios/ para almacenar la información de los usuarios."

# Función para guardar información de cada usuario
guardar_info_usuario() {
  local usuario=$1
  local archivo="usuarios/$usuario.txt"

# Guardar nombre de usuario y grupos
  echo "Usuario: $usuario" > $archivo
  echo "Grupos: $(groups $usuario)" >> $archivo

# Guardar permisos sobre los directorios
  echo "Permisos sobre /tmp/empresa/admin: $(getfacl /tmp/empresa/admin | grep $usuario || echo 'Sin permisos específicos')" >> $archivo
  echo "Permisos sobre /tmp/empresa/tecnicos: $(getfacl /tmp/empresa/tecnicos | grep $usuario || echo 'Sin permisos específicos')" >> $archivo
  echo "Permisos sobre /tmp/empresa/compartido: $(getfacl /tmp/empresa/compartido | grep $usuario || echo 'Sin permisos específicos')" >> $archivo

# Agregar una línea de separación para que sea más legible
  echo "----------------------------------" >> $archivo
}

# Guardar información de los usuarios creados
log_actividad "Guardando información sobre los usuarios."
guardar_info_usuario "admin1"
guardar_info_usuario "tecnico1"
guardar_info_usuario "auditor1"
log_actividad "Información de los usuarios guardada correctamente."

# Exportar el informe a un archivo de texto
INFORME_FILE="informes/usuarios_$(date +%Y%m%d_%H%M%S).txt"
echo "Usuarios y permisos creados:" > $INFORME_FILE
cat usuarios/*.txt >> $INFORME_FILE
log_actividad "Informe de usuarios exportado a $INFORME_FILE."

echo "Usuarios y permisos creados correctamente."
