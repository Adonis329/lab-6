#!/bin/bash

# Переменная, которая указывает на директорию для резервных копий
backup_dir="$HOME/backup"

# Создаем директорию для резервных копий, если она не существует
mkdir -p "$backup_dir"

# Определztv имя файла скрипта
script_name="${0##*/}"

# Определите имя файла архива с текущей датой
timestamp=$(date +'%Y%m%d%H%M%S')
archive_name="$backup_dir/${script_name}_${timestamp}"


archive_command="tar -cf $archive_name.tar $0"


eval $archive_command

if [ $? -eq 0 ]; then
  echo "Резервная копия скрипта создана и архивирована: $archive_name"
else
  echo "Ошибка при создании резервной копии и архивации."
fi

