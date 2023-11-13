#!/bin/bash

# Проверяем наличие обоих аргументов (формат и путь к директории)
if [ $# -ne 2 ]; then
  echo "Использование: $0 <формат файла> <путь к директории>"
  exit 1
fi


file_format="$1"

directory="$2"


if [ ! -d "$directory" ]; then
  echo "Указанная директория не существует."
  exit 1
fi

# Используем команду find 
file_count=$(find "$directory" -type f -name "*.$file_format" | wc -l)

# Выводим количество файлов с заданным форматом
echo "Количество файлов с форматом .$file_format в директории $directory: $file_count"

