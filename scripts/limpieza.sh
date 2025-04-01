#!/bin/bash

find /tmp/empresa/ -type f -mtime +7 -exec rm {} \;
echo "Archivos temporales de más de 7 días eliminados."
