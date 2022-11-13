# АВС-ИДЗ1. Крупнов Иван, БПИ217, вариант 14

**Индивидуальное домашнее задание №2 по курсу Архитектуры вычислительных систем. Домашнее задание выполнено на предполагаемую оценку 7.**

## Задание
> Разработать программу, вычисляющую отдельно число прописных и строчных букв в заданной ASCII-строке.


## Структура проекта
* [asm](https://github.com/shar3nda/avs-ihw2/tree/main/asm) — код на ассемблере без флагов оптимизации, в котором **прокомментированы переменные** и операции над ними
* [asm_opt](https://github.com/shar3nda/avs-ihw2/tree/main/asm) — оптимизированный с помощью флагов компиляции код на ассемблере
* [asm_reg](https://github.com/shar3nda/avs-ihw2/tree/main/asm) — код на ассемблере без флагов оптимизации, в котором прокомментированы переменные и использованы регистры вместо некоторых локальных переменных.
* [scripts](https://github.com/shar3nda/avs-ihw2/tree/main/scripts) — скрипты для тестирования
    * [generate_tests.py](https://github.com/shar3nda/avs-ihw2/blob/main/scripts/generate_tests.py) — утилита для генерации тестов на Python
    * [run_tests.sh](https://github.com/shar3nda/avs-ihw2/blob/main/scripts/run_tests.sh) — bash-скрипт для прогона тестов. Использование: `run_tests.sh ./<executable_name>`
* [tests](https://github.com/shar3nda/avs-ihw2/tree/main/tests) — автоматически сгенерированные тесты для программы
    * В файле tests/{i}.in находятся входные данные для i-го теста, а в tests/{i}.out - корректные выходные данные. Непройденные тесты автоматически выводятся скриптом [run_tests.sh](https://github.com/shar3nda/avs-ihw2/blob/main/scripts/run_tests.sh) с помощью diff.
* [main](https://github.com/shar3nda/avs-ihw2/blob/main/main) — исполняемый файл программы
* [main_opt](https://github.com/shar3nda/avs-ihw2/blob/main/main_opt) — исполняемый файл программы, скомпилированный с оптимизациями
* [tests_unoptimized.log](https://github.com/shar3nda/avs-ihw2/blob/main/tests_unoptimized.log) — логи тестирования неоптимизированного бинарника
* [tests_optimized](https://github.com/shar3nda/avs-ihw2/blob/main/tests_optimized.log) — логи тестирования оптимизированного бинарника
* [main.c](https://github.com/shar3nda/avs-ihw2/blob/main/main.c), [fillArray.c](https://github.com/shar3nda/avs-ihw2/blob/main/fillArray.c), [printArray.c](https://github.com/shar3nda/avs-ihw2/blob/main/printArray.c), [readArray.c](https://github.com/shar3nda/avs-ihw2/blob/main/readArray.c) — исходные файлы на языке C

# Задания на 4 балла

## Использование программы
* На первой строке вводится длина массива A.
* На второй строке через пробел вводятся все элементы массива A.
* На вывод поступают элементы массива B.
* **Предполагается, что входные данные корректны и содержат последовательность целых чисел с хотя бы одним положительным элементом.**

## Результаты тестирования
Логи тестирования находятся в файлах [tests_unoptimized.log](https://github.com/shar3nda/avs-ihw2/blob/main/tests_unoptimized.log) и [tests_optimized.log](https://github.com/shar3nda/avs-ihw2/blob/main/tests_optimized.log). Чтобы самостоятельно провести тестирование, необходимо выполнить `./scripts/run_tests.sh ./main` или `./scripts/run_tests.sh ./main_opt`.

Отдельно протестированы крайние случаи.
![Крайние случаи](images/edge_cases.png)

## Опции компиляции
Ассемблирование без оптимизаций:
```sh
gcc -masm=intel ./file.c -S -o ./asm/file.s
```
Ассемблирование с оптимизациями:
```sh
gcc -masm=intel \
    -fno-asynchronous-unwind-tables \
    -fno-jump-tables \
    -fno-stock-protector \
    -fno-exception \
    ./file.c \
    -S -o ./asm/file_opt.s 
```
После ассемблирования файлов по отдельности программа компилируется в исполняемый файл:
```sh
gcc asm/main.s asm/fillArray.s asm/printArray.s asm/readArray.s -o main
```
С оптимизациями:
```sh
gcc asm/main_opt.s asm/fillArray_opt.s asm/printArray_opt.s asm/readArray_opt.s -o main_opt
```

## Оптимизация ассемблированных программ
Помимо ключей командной строки были проведены следующие ручные оптимизации:
* Убраны инструкции `cdqe` и `movsx rXX eXX`
* Удалены лишние строчки в начале и в конце:
    * `.file	"filename.c"`
    * `.type	funcname, @function`
    * `.ident	"GCC: (GNU) 12.2.0"`
	* `.section	.note.GNU-stack,"",@progbits`
* Убраны ненужные присваивания через регистр `rax`:
    * `mov	eax, DWORD PTR [rax]; mov	esi, eax` -> `mov	esi, DWORD PTR [rax]`
    * `lea	rax, .LC0[rip]; mov	rdi, rax` -> `lea	rdi, .LC0[rip]`

# Задания на 5 баллов

## Функции с параметрами
В отдельных файлах реализованы следующие функции:
* [readArray.c](https://github.com/shar3nda/avs-ihw2/blob/main/readArray.c) — считывает с `stdin` массив `a` и возвращает позицию последнего положительного элемента
* [fillArray.c](https://github.com/shar3nda/avs-ihw2/blob/main/fillArray.c) — заполняет массив `b`
* [printArray.c](https://github.com/shar3nda/avs-ihw2/blob/main/printArray.c) — печатает массив `b`

## Локальные переменные
В функциях используются локальные переменные, например, в [readArray.c](https://github.com/shar3nda/avs-ihw2/blob/main/readArray.c) используются `int index` для хранения позиции последнего положительного элемента и `int last_pos_found` как флаг того, что положительные элементы в `a` закончились.

## Передача параметров и возвращаемые значения
В [asm_commented](https://github.com/shar3nda/avs-ihw2/tree/main/asm_commented) комментариями отмечены передаваемые и возвращаемые значения в функциях.

## Связь между стеком и параметрами C
В [asm_commented](https://github.com/shar3nda/avs-ihw2/tree/main/asm_commented) аналогично отмечено назначение регистров.

Функции принимают аргументы 1-6 в регистры `rdi`, `rsi`, `rdx`, `rcx`, `r8` и `r9`, остальные в обратном порядке добавляются на стек. 

Регистры `rbx`, `rsp`, `rbp`, `r12`, `r13`, `r14`, и `r15` после выполнения функции сохраняют записанное значение, а `rax`, `rdi`, `rsi`, `rdx`, `rcx`, `r8`, `r9`, `r10` и `r11` затираются.

# Задания на 6 баллов

## Рефакторинг и комментарии к регистрам
Локальные переменные в [fillArray.c](https://github.com/shar3nda/avs-ihw2/blob/main/fillArray.c), [printArray.c](https://github.com/shar3nda/avs-ihw2/blob/main/printArray.c), [readArray.c](https://github.com/shar3nda/avs-ihw2/blob/main/readArray.c) убраны со стека и помещены в незатираемые регистры. Например, в [readArray.c](https://github.com/shar3nda/avs-ihw2/blob/main/readArray.c) произведены следующие замены:
* `r13d = index = -1`
* `r14d = last_pos_found = 0`
* `r15d = i = 0`

Комментарии к регистрам описаны.

## Тестовые прогоны
Тесты произведены без ошибок, как и в предыдущих случаях.