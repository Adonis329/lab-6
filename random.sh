#!/bin/bash

# Функция для генерации случайной буквы латинского алфавита
random_letter() {
# Получаем случайное число от 0 до 25
random_num=$((RANDOM % 26))
# Преобразуем число в соответствующую букву (0=A, 1=B и так далее)
letter=$(printf "\x$(printf %x $((65 + random_num)))")
echo -n $letter
}

# Длина последовательности (количество букв)
sequence_length=20

# Генерируем случайную последовательность букв
random_sequence=""
for ((i = 0; i < sequence_length; i++)); do
random_sequence="$random_sequence$(random_letter)"
done

echo "Случайная последовательность букв: $random_sequence"

