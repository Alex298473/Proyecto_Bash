#!/bin/bash

BACKUP_DIR="respaldo"
TAR_FILE="$BACKUP_DIR/backup_$(date +%Y%m%d_%H%M%S).tar.gz"

mkdir -p $BACKUP_DIR
tar -czf $TAR_FILE /tmp/empresa/

echo "Backup guardado en $TAR_FILE"

