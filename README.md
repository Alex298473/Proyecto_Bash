# Proyecto_Bash

# Proyecto Final: Automatización y Administración de Sistemas en Bash

## Descripcion

Este proyecto tiene como objetivo la automatización de tareas administrativas en un entorno Linux utilizando Bash.
Se han desarrollado varios scripts para gestionar usuarios, manejar logs, realizar backups y limpiar archivos temporales.

## Estructura del proyecto

Proyecto_Bash/
│── main.sh               # Script principal con menú de opciones
│── README.md             # Explicación del proyecto
│── scripts/              # Carpeta con scripts auxiliares
│   ├── usuarios.sh       # Gestión de usuarios y permisos
│   ├── logs.sh           # Simulación y análisis de logs
│   ├── backup.sh         # Copias de seguridad de archivos
│   ├── limpieza.sh       # Eliminación de archivos temporales
│── logs/                 # Carpeta para almacenar los logs y actividades generados
│── usuarios/             # Información sobre usuarios creados
│── respaldo/             # Copias de seguridad generadas
│── informes/             # Carpeta donde se guardarán los archivos .txt generados por los scripts


## Explicación de los Scripts

- **main.sh**: Este es el script principal del proyecto. Actúa como un menú interactivo que llama a los otros scripts, facilitando la ejecución de las tareas administrativas de manera ordenada.
- **usuarios.sh**: Permite la creación y eliminación de usuarios en el sistema, utilizando los comandos `useradd` y `userdel` para gestionar usuarios de forma automatizada.
- **logs.sh**: Genera registros de actividad del sistema y proporciona herramientas para visualizar y analizar dichos logs. Utiliza comandos como `cat`, `grep` y `tail` para manejar los archivos de log.
- **backup.sh**: Realiza copias de seguridad de la carpeta `/tmp/empresa/`. Crea un archivo comprimido `.tar.gz` con la fecha actual en el nombre, facilitando la restauración de datos en caso de ser necesario.
- **limpieza.sh**: Elimina archivos temporales en la carpeta `/tmp/empresa/` que tengan más de 7 días de antigüedad. Utiliza `find` con el parámetro `-mtime +7` y `rm` para realizar la limpieza automáticamente.

## Instalación y Uso

1. **Clonar el repositorio**:

   ```bash
   git clone https://github.com/tu-usuario/Proyecto_Bash.git
   cd Proyecto_Bash
1. **Dar permisos de ejecución a los scripts**:

   ```bash
   chmod +x *.sh
3. **Ejecutar el script principal**:

   ```bash
   ./main.sh

## Autor

Este proyecto fue creado por [Alejandro Gómez Andrés](https://github.com/Alex298473).

