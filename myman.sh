#!/bin/bash

# Проверка наличия аргумента (названия команды)
if [ $# -ne 1 ]; then
echo "Использование: $0 <название_команды>"
exit 1
fi

# Название команды, переданное в аргументе
command_name=$1

# Путь к каталогу с файлами man
man_dir="/usr/share/man/man1"

# Полный путь к файлу справки
man_file="$man_dir/$command_name.1.gz"

# Проверка наличия файла справки
if [ -e "$man_file" ]; then
# Открытие файла справки с использованием less
less "$man_file"
else
echo "Справка для '$command_name' не найдена."
exit 1
fi

