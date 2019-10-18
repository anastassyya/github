//ДЗ 06 - Функции. Простые
//
//Материал для изучения: https://swiftbook.ru/content/languageguide/functions/
/*Выполнил:    Вишневская Анастасия
 Группа:    iOS 19-2
 Дата сдачи:    27.09.2019
 */

//
print ("6.1. Создайте пару функций с короткими именами, которые возвращают строку с классным символом или символами. Например heart() возвращает сердце и т.п. Вызовите все эти функции внутри принта для вывода строки этих символов путем конкатенации")

func telephone () -> String {
    return "\u{260E}"
}
func exclamationMark () -> String {
    return "\u{2753}"
}
func umbrella () -> String {
    return "\u{2614}"
}
print (umbrella() + telephone() + exclamationMark())

////////////////////////
print ("6.2. Написать функцию которая: принимает массив целых чисел, возвращает  минимальный положительный элемент массива (Int). Если такого элемента не найдено, то возвращает nil")

func minPositiveElement (array: [Int]) -> Int? {
    var minPosElem: Int? = nil
    for element in array {
        if element > 0 {
            minPosElem = element
            break
        }
    }
    for element in array {
        if element > 0 && element < minPosElem! {
            minPosElem = element
        }
    }
    return minPosElem
}

var arraySecond = [-1, -4, -7, -6, -5, 5, -9]
print ("original array is \(arraySecond)")
if let variable = minPositiveElement (array: arraySecond) {
    print ("Minimum positive element is \(variable)")
} else {
    print ("there are no positive elements")
}


///////////////////////
print ("6.3. Написать функцию которая: принимает массив целых чисел, возвращает  опциональный кортеж содержащий минимальный положительный элемент массива и его индекс (index: Int, value: Int)? Если такого элемента не найдено, то возвращает nil")

func minPosElemAndItsIndex (array : [Int]) -> (index : Int, value : Int)? {
    var minPos : (index : Int, value : Int)?
    for (index, element) in array.enumerated() {
        if element > 0 {
            minPos = (index, element)
            break
        }
    }
    for (index, element) in array.enumerated(){
        if element > 0 && element < minPos!.value {
            minPos = (index, element)
        }
    }
    return (minPos)
}

print ("original array is \(arraySecond)")
if let variable = minPosElemAndItsIndex(array : arraySecond) {
    print ("Minimum positive element and its index are \(variable)")
} else {
    print ("there are no positive elements")
}


///////////////////////////////
print ("6.4. Написать функцию которая: принимает массив целых чисел, возвращает  кортеж (tuple) содержащий минимальный положительный элемент массива и его индекс (index: Int?, value: Int?). Если такого элемента не найдено, то возвращает кортеж, значения в котором равны nil")

func minPosElemAndItsIndexSecond (array : [Int]) -> (index : Int?, value : Int?) {
    var minPos : (index : Int?, value : Int?)
    for (index, element) in array.enumerated() {
        if element > 0 {
            minPos = (index, element)
            break
        }
    }
    for (index, element) in array.enumerated(){
        if element > 0 && element < minPos.value! {
            minPos.index = index
            minPos.value = element
        }
    }
    return (minPos.index!, minPos.value!)
}

print ("original array is \(arraySecond)")
if let variable1 = minPosElemAndItsIndexSecond(array : arraySecond).index , let variable2 = minPosElemAndItsIndexSecond(array : arraySecond).value {
    print ("Minimum positive element and its index are \(variable1), \(variable2)")
} else {
    print ("there are no positive elements")
}



////////////
print ("6.5.1 Создайте функцию, которая принимает массив, а возвращает массив в обратном порядке")

func reversedArray (array : [Int]) -> [Int] {
    var copyArray = array
    var temp = 0
    let count = array.count
    for index in 0..<count/2 {
        temp = copyArray[index]
        copyArray[index] = copyArray[count-1-index]
        copyArray[count-1-index] = temp
    }
    return copyArray
}

var arrayTask651 = [6, 1, 50, 32, 9, 0, 4, 2]
print ("Array is \(arrayTask651)")
print ("Reversed array is \(reversedArray (array: arrayTask651))")

////////////////////////
print ("6.5.2 Используя  inout  выполните задание номер 6.4 так, чтобы функция не возвращала перевернутый массив, но меняла элементы в существующем. Что будет если убрать inout?")

func reversedArrayChange (array : inout [Int]){
    var temp = 0
    let count = array.count
    for index in 0..<count/2 {
        temp = array[index]
        array[index] = array[count-1-index]
        array[count-1-index] = temp
    }
}

print ("Array is \(arrayTask651)")
reversedArrayChange(array : &arrayTask651)
print ("Reversed Array is \(arrayTask651)")


//////////////////
print ("6.6. Создайте функцию, которая принимает два массива ar1 и ar2. Возвращает массив в котором элементы Х[i] состоят из суммы элементов входящих массивов поэлементно. Размер массива Х должен быть равен наибольшему размеру из ar1 и ar2. Например: ar1:[1, 2, 3, 4], arr2: [10, 20, 30, 40, 50, 60]  -> X[11, 22, 33, 44, 50, 60] ")

func arraysChange (_ arrayFirst : [Int], _ arraySecond : [Int]) -> [Int] {
    var copyArrayFirst = arrayFirst
    var copyArraySecond = arraySecond
    var copyArrayThird = [Int]()
    var count = 0
    if copyArrayFirst.count > copyArraySecond.count {
        copyArraySecond = copyArraySecond + Array(repeating : 0, count : (copyArrayFirst.count - copyArraySecond.count))
        count = copyArrayFirst.count
    }
    else {
        copyArrayFirst = copyArrayFirst + Array(repeating : 0, count : (copyArraySecond.count - copyArrayFirst.count))
        count = copyArraySecond.count
    }
    for index in 0..<count {
        copyArrayThird.append (copyArrayFirst[index] + copyArraySecond[index])
    }
    return copyArrayThird
}
var arr1 = [1, 2, 3, 4]
var arr2 = [10, 20, 30, 40, 50, 60]
print ("First array is \(arr1)")
print ("Second array is \(arr2)")
print ("New array is \(arraysChange (arr1, arr2))")



