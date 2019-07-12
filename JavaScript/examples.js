// + Напишите программу, которая считает площадь прямоугольника, спрашивая у пользователя длину двух сторон
const rec_area = function () {

    let side_a = parseFloat(prompt('input side A'));
    let side_b = parseFloat(prompt('input side B'));

    return side_a * side_b
};


// + Напишите программу, которая спрашивает у пользователя два числа и знак: "+" или "-".
// В зависимости от знака выводит их сумму или разницу
function isNumeric(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}

function sum_or_sub() {

    let num1 = parseFloat(prompt("Input first number"));
    let num2 = parseFloat(prompt("input second number"));

    if (isNumeric(num1) && isNumeric(num2)) {
        let input_ = prompt("If you want to addition your numbers input '+', to subscribe input '-'");

        switch (input_) {
            case "+":
                return num1 + num2;
            case "-":
                return num1 - num2;
        }
    }

    else {
        alert("Wrong input")
    }
}


// + Напишите программу, которая находит все простые числа между 0 и пользовательским числом
function simple_numbers() {

    let numbers = [];
    let num = parseFloat(prompt("input second number"));

    if (isNumeric(num)) {
        for (let i = 1; i < num + 1; i++) {
            if (i % 2 === 0) {
                numbers = numbers + ',' + i
            }
        }
        return numbers
    }

    else {
        alert("Wrong input")
    }

}


// + Напишите программу, которая выводит все кратные 5 числа между двумя пользовательскими числами
function numbers_multiple_55() {

    let numbers = [];
    let num1 = parseFloat(prompt("input second number"));
    let num2 = parseFloat(prompt("input second number"));

    if (isNumeric(num1) && isNumeric(num2)) {
        for (let i = num1; i < num2 + 1; i++) {
            if (i % 5 === 0) {
                numbers = numbers + ',' + i
            }
        }
        return numbers
    }

    else {
        alert("Wrong input")
    }

}


// + Создать лист из 6 любых чисел. Отсортировать его по возрастанию
function sort_array6() {
    let arr = [3, 15, 1, 8, 4, 12];
    arr.sort(function (a, b) {
        return a - b
    });

    return arr
}


// + Создать словарь из 5 пар: int -> str, например {6: '6'}, вывести его в консоль попарно
function dict_() {
    let dict = {1: '1', 2: '2', 3: '3', 4: '4', 5: '5'};

    for (let i in dict) {
        alert("key: " + i + ",value: " + dict[i])
    }
}


// + Создать tuple из 10 любых дробных чисел, найти максимальное и минимальное значение в нем
function min_max_in_mas() {

    let arr = [1, 21, 0, 10, 15, -6, 99, -7.9, 3.14, -99];
    let max = Math.max(...arr);
    let min = Math.min(...arr);

    return "Min: " + min + ", Maz[: " + max;
}


// + Создать лист из 3 слов: ['Earth', 'Russia', 'Moscow'], соеденить все слова в единую строку,
// чтобы получилось: 'Earth -> Russia -> Moscow'
function eath() {
    let arr = ['Earth', 'Russia', 'Moscow'];

    return arr.join('=>')
}


// + Взять строку '/bin:/usr/bin:/usr/local/bin' и разбить ее в список по символу ':'
function str_split() {

    let str1 = '/bin:/usr/bin:/usr/local/bin'.split(':');

    return str1
}


// + Пройти по всем числам от 1 до 100, написать в консоль, какие из них делятся на 7, а какие - нет
function divided_seven() {

    for (let i = 0; i < 100 + 1; i++) {
        if (i % 7 === 0) {
            console.log('Number divided by 7: ', i)
        }
        console.log('Simple number: ', i)
    }
}


// + Создать матрицу любых чисел 3 на 4, сначала вывести все строки, потом все столбцы
function matrix() {
    matrix = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]];
    for (let i in matrix) {
        console.log(matrix[i])
    }

    for (let i = 0; i < 4; i++) {
        console.log("row: ");
        for (let j = 0; j < 3; j++) {
            console.log(matrix[j][i])
        }
    }
}


// + Создать список любых объектов, в цикле напечатать в консоль: объект и его индекс
function some_list() {
    let lst = ['awda', 1231231, {33: 'fasf'}, 'and_other'];

    for (let i in lst) {
        console.log(i, ':', lst[i])
    }
}


// + Создать список с тремя значениями 'to-delete' и нескольми любыми другими, удалить из него все значения 'to-delete'
function list_del() {
    let lst = ['awda','to-delete', 1231231, {33: 'fasf'},'to-delete', 'and_other','to-delete'];

    let lst2 = lst.filter(item => item !== 'to-delete');

    return lst2
}


// + Пройти по всем числам от 1 до 10 в обратную сторону (то есть: от 10 до 1), напечатать их в консоль
function reverse_() {
    for (let i = 10; i > 0; i--) {
        console.log(i)
    }
}