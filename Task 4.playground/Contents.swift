/*Выполнил:    Вишневская Анастасия
 Группа:        iOS 19-2
 Дата сдачи:    15.09.2019
*/

/* Задание  №4. Работа с массивами
 
 4.1 Вывести на экран таблицу Пифагора. (без использования массивов, только с помощью вложенных циклов. Можно использовать временную переменную типа String)
 */

var operation : Int
var endY = 10
var endX = 10
for x in 0...endX {
    print ("\(x) \t", terminator : "")
}
for y in 1...endY  {
    print ("\n\(y) \t", terminator : "")
    for x in 1...endX {
        operation = x * y
        print ("\(operation) \t", terminator: "")
    }
}


/*
 4 Пункт для всех заданий(кроме первого):
 Создайте массив из 10 элементов. Заполните случайным образом. Вывести массив на экран.
 */
var arr = [3, 5, 4, 10, 2, 6, 12, 42, 74, 1]
print (arr)

/*
 4.2 Найдите сумму нечетных элементов массива и произведение четных элементов массива
 */
var sum = 0
var product = 0
for item in arr {
    if item % 2 != 0 {
        sum += item
    }
    else {
        product += item
    }
}
print ("Sum of odd elements in the array is \(sum). Product of even elements in the array is \(product)")


/*
 4.3 Поменяйте местами элементы массива (первый с последним, второй с предпоследним и т.д.)
 
 1 СПОСОБ
 */
var temp = 0
let count = arr.count
for index in 0..<count/2 {
    temp = (arr [index])
    (arr [index]) = (arr [count - 1 - index])
    (arr [count - 1 - index]) = temp
}
print ("new array is \(arr)")

/*
 2 СПОСОБ
 */

for i in 0..<count/2 {
    (arr[i], arr[count - i - 1])  = (arr[count - i - 1],arr[i])
}
print ("new array is \(arr)")

// 3 СПОСОБ

arr.reverse()
print ("new array is \(arr)")

/*
 4.4 Найдите минимальный положительный элемент массива
 */

temp = arr[0]
for i in arr where i > 0 {
    if temp > i {
        temp = i
    }
}
print ("min positive number = \(temp)")

/*
 4.5 Найдите кол-во элементов массива, которые больше 5 и меньше 20. Выведите их на экран.
 
 */
var countElements = 0
for i in arr {
    if i > 5 && i < 20 {
        print (i)
        countElements += 1
    }
}
print ("a quantity of these elements is \(countElements)")

/*
 Для пытливых умов:
 4.Доп.1. Если в данном массиве действительных чисел а1,...,аn есть хотя бы один член, меньший чем -2,то все отрицательные члены заменить их квадратами.
 [2, -4, 5,  -7] -> [2, 16, 5, 49]
 */
var arrayN = [2, -4, 5, -7]
print ("original array is \(arrayN)")
var exponent = 0
for (index, element) in arrayN.enumerated() where arrayN[index] < -2 {
    arrayN[index] = element * element
}
print (arrayN)

/*
 4.Доп.2. Дан массив целых чисел a1,...,an. Найти количество и сумму тех членов массива а1,..,аn,которые делятся на 5 и не делятся на 7. Выдать эти члены массива на экран.
 [3, 5, 15, 35, 70, 14]
*/


var arrayNext = [3, 5, 15, 35, 70, 14]
print ("original array is \(arrayNext)")
var numberNecessaryElements = 0
var sumNecessaryElements = 0
for (index, element) in arrayNext.enumerated() {
    if element % 5 == 0 && element % 7 != 0 {
        sumNecessaryElements += element
        numberNecessaryElements += 1
    }
}
print ("sum of necessary elements is \(sumNecessaryElements), number of necessary elements is \(numberNecessaryElements)")



