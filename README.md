# Proyecto_Bash

# Proyecto Final: Automatización y Administración de Sistemas en Bash

## Descripcion
Este proyecto tiene como objetivo la automatización de tareas administrativas en un entorno Linux utilizando Bash.
Se han desarrollado varios scripts para gestionar usuarios, manejar logs, realizar backups y limpiar archivos temporales.

## Estructura del proyecto
Proyecto_Bash/
│── main.sh               # Script principal con menú
│── README.md             # Explicación del proyecto
│── scripts/              # Carpeta de scripts auxiliares
│   ├── usuarios.sh       # Manejo de usuarios y permisos
│   ├── logs.sh           # Simulación y análisis de logs
│── logs/                 # Carpeta donde se guardarán los logs
│── usuarios/             # Información sobre usuarios creados
│── respaldo/             # Copias de seguridad simuladas

## Explicacion de los scripts
- main.sh -> Actúa como el script principal que llama a usuarios.sh, logs.sh, backup.sh y limpieza.sh.
Organiza el flujo del proyecto y facilita la ejecución de las tareas.
- usuarios.sh -> Permite la creación y eliminación de usuarios en el sistema. Usa useradd y userdel para gestionar usuarios de manera automática.
- logs.sh -> Genera registros de actividad del sistema y permite visualizarlos. Usa cat, grep y tail para manejar logs.
- backup.sh -> Realiza copias de seguridad de la carpeta /tmp/empresa/.
Crea un archivo comprimido (tar.gz) con la fecha actual para facilitar la restauración.
- limpieza.sh -> Elimina archivos en /tmp/empresa/ que tengan más de 7 días. Usa find con -mtime +7 y rm para limpiar archivos antiguos.

## Instalacion y uso
1. Clonar el repositorio: 
git clone https://github.com/tu-usuario/Proyecto_Bash.git
cd Proyecto_Bash
2. Dar permisos de ejecucion a los scripts:
chmod +x *.sh
3. Ejecutar el script principal:
./main.sh

## Autor
- Nombre: Alejandro Gómez Andrés
- Contacto: agomezandres9@gmail.com

