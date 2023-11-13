#!/bin/bash

# Проверяем количество аргументов
if [ $# -ne 4 ]; then
echo "Использование: $0 <t1> <t2> <semaphore_file> <output_file>"
exit 1
fi

t1=$1 # Время ожидания освобождения ресурса
t2=$2 # Время использования ресурса
semaphore_file=$3 # Файл-семафор
output_file=$4 # Файл для вывода информации

# Функция для ожидания освобождения ресурса
wait_for_semaphore() {
while ! ln "$semaphore_file" "$semaphore_file.lock" 2> /dev/null; do
sleep 1
echo "Ожидание освобождения ресурса..."
done
}

# Ожидание освобождения ресурса
wait_for_semaphore

# Войти в критическую секцию
echo "Ресурс используется процессом $$" » "$output_file"

# Ждем t2 секунд для использования ресурса
sleep $t2

# Освобождаем ресурс и выходим из критической секции
rm "$semaphore_file.lock"
echo "Ресурс освобожден процессом $$" » "$output_file"

exit 0
