//ДЗ 08 - Замыкания (Closures)
/*Выполнил:    Вишневская Анастасия
 Группа:    iOS 19-2
 Дата сдачи:    11.10.2019
 */


print ("""
8.1.  (2 балла) Написать функцию mySort, которая принимает в качестве параметров:
1) массив целых чисел,
2) замыкание, которое определяет, направление сортировки.
Возвращает отсортированный массив.\n
""")

func array (arr: [Int], closure: (Int, Int) -> Bool) -> [Int] {
    var arrayCopy = arr
    var minIndex = 0
    var temp = 0
    let count = arrayCopy.count
    for _ in 0..<count {
        for i in 0..<count {
            if closure (arrayCopy[i], arrayCopy[minIndex]) {
                temp = arrayCopy[i]
                arrayCopy[i] = arrayCopy[minIndex]
                arrayCopy[minIndex] = temp
                
            }
        
}
    minIndex += 1
    
    }
    return arrayCopy
}

var arrayTaskFirst = [1, 8, -1, -9, -10, 2, 4]
print ("Array in the task 1 is \(arrayTaskFirst)")
print ("""
Sorted array FIRST is \(array (arr: arrayTaskFirst, closure: {(parameter1, parameter2) -> Bool in return (parameter1 < parameter2)
})
)\n
""")
print ("""
    Sorted array SECOND is \(array (arr: arrayTaskFirst, closure: {$0 < $1})
    )\n
    """)


//////////////////////////////


print ("""
8.2.  (2 балла) Написать функцию myMap, которая принимает в качестве параметров:
1) массив целых чисел
2) замыкание, которое определяет, как изменить каждый элемент массива.
Возвращает массив в котором все элементы изменены согласно замыканию.

Примеры вызова взять с урока из примера Map

    var newArray3 = myMap(myArray){ $0*$0 }\n
""")

func myMap (_ arr: [Int], _ closure: (Int) -> Int) -> [Int] {
    var operation = 0
    var newArray = [Int]()
    for i in arr {
        operation = closure (i)
        newArray.append(operation)
    }
    return newArray
}

var arrayTaskSecond = [9, 40, 14, 18, 0, -1, 4, -20]

print ("Array in the task 2 is \(arrayTaskSecond)")
print ("""
New array: degree ^ 2 \(myMap(arrayTaskSecond,{$0*$0})
)\n
""")


///////////////////////////


print ("""
8.3 (2 балла)  Используя стандартный map() преобразовать массив строк, добавив в конец символ “!”
[“a”, “asd”, “r”,”kk”] -> [“a!”, “asd!”, “r!”,”kk!”]
""")

var arrayTaskThree = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
let arrayWithExclamationMark = arrayTaskThree.map({ (value: String) -> String in
    return value + "!"
})
print ("Array in the task 3 is \(arrayTaskThree)")
print("Array with exclamation mark: \(arrayWithExclamationMark)\n")


////////////////////////////


print ("""
8.4. (2 балла) Пользуясь только функциями filter, map и reduce
Найдите кол-во элементов целочисленного  массива, которые больше 5 и меньше 20. Выведите их на экран.\n
""")

let arrayTaskFour = [30, 17, 54, 1, 6, 19, 83, 4, 97, 12]
print ("Array in the task 4 is \(arrayTaskFour)\n")

//combination MAP && REDUCE
let certainChoice = arrayTaskFour.map ({ (value : Int) -> Int in
    if value > 5 && value < 20 {
        return 1
    }
    else {
        return 0
    }
}).reduce(0, {(sum: Int, item: Int) in
    return sum + item
})
print ("Combination MAP && REDUCE. The quantity of elements is \(certainChoice)")
let newArray = arrayTaskFour.filter {value in
    return value > 5 && value < 20}
print ("These elements are \(newArray)\n")

print ("""
8.5 (2 балла) Пользуясь только функциями filter, map и reduce
Найдите сумму нечетных элементов массива и произведение четных элементов массива

""")

//Combination FILTER && REDUCE
print ("Array in the task 5 is \(arrayTaskFour)\n")
let sumOddElements = arrayTaskFour.filter{value in
    return value % 2 == 1
}.reduce(0, {(sum: Int, value: Int) in
    return sum + value
})
print ("Sum of odd elements is \(sumOddElements)\n")


let productEvenElements = arrayTaskFour.filter{value in
    return value % 2 == 0
    }.reduce(1, {(sum: Int, value: Int) in
        return sum * value
})
print ("Product of even elements is \(productEvenElements)")

