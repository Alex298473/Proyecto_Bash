#!/bin/bash

# Crear grupos
groupadd administracion_v4
groupadd tecnicos_v4

# Crear usuarios y asignarlos a grupos
useradd -m -G administracion admin1_v4
useradd -m -G tecnicos tecnico1_v4
useradd -m auditor1_v4

# Crear directorios
mkdir -p /tmp/empresa/admin /tmp/empresa/tecnicos /tmp/empresa/compartido

# Aplicar permisos especiales
chmod u+s /tmp/empresa/admin        # SetUID
chmod g+s /tmp/empresa/tecnicos     # SetGID
chmod +t /tmp/empresa/compartido    # Sticky Bit

# Dar acceso a auditor1 con ACL
setfacl -m u:auditor1:r /tmp/empresa/admin

# Crear archivos de información sobre los usuarios en la carpeta usuarios/
mkdir -p usuarios

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
guardar_info_usuario "admin1_v4"
guardar_info_usuario "tecnico1_v4"
guardar_info_usuario "auditor1_v4"

echo "Usuarios y permisos creados correctamente."
