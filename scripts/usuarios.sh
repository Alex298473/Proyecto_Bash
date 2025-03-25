#!/bin/bash

# Crear grupos
groupadd administracion
groupadd tecnicos

# Crear usuarios y asignarlos a grupos
useradd -m -G administracion admin1
useradd -m -G tecnicos tecnico1
useradd -m auditor1

# Crear directorios
mkdir -p /tmp/empresa/admin /tmp/empresa/tecnicos /tmp/empresa/compartido

# Aplicar permisos especiales
chmod u+s /tmp/empresa/admin        # SetUID
chmod g+s /tmp/empresa/tecnicos     # SetGID
chmod +t /tmp/empresa/compartido    # Sticky Bit

# Dar acceso a auditor1 con ACL
setfacl -m u:auditor1:r /tmp/empresa/admin

echo "Usuarios y permisos creados correctamente."
