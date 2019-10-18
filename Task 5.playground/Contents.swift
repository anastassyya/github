//Домашнее задание  №5. Работа с массивами.


/*Выполнил:    Вишневская Анастасия
 Группа:    iOS 19-2
 Дата сдачи:    20.09.2019
*/
 
 print ("Задание 1. Найти сумму  элементов, находящихся между первым и последним отрицательными элементами")
 var arr = [2, 8, 4, 5, 2, -1, 12, 40]
 print ("original array is \(arr)")
 var sumFirst = 0
 var firstNegative = 0
 var secondNegative = 0
 var count = arr.count
 var countNegative = 0
 for (index, _) in arr.enumerated() {
    if arr[index] < 0 {
        countNegative += 1
    }
  }
 
 if countNegative > 1 {
    for (index, _) in arr.enumerated() where arr[index] < 0 {
        firstNegative = index
        break
    }
    for index in (0..<arr.count).reversed() where arr[index] < 0 {
        secondNegative = index
        break
    }
    for i in firstNegative+1..<secondNegative {
        sumFirst += arr[i]
        }
 print ("the sum of elements, which are between first and last negative elements are \(sumFirst)")
 } else {
    print ("There are no two negative numbers")
 }

////////////////////
 print ("Задание 2. Преобразовать массив так, чтобы сначала шли все отрицательные     элементы, а потом положительные(0 считать положительным). (не использовать встроенный remove, insert, append)")
 var arrSecond = [2, 8, 4, 0, 2, 0, 0, -1]
 print ("original array is \(arrSecond)")
 var countOfNegative = 0
 var countOfCycle = 0
 var temp1 = 0
 var temp2 = 0
 var certainIndex = 0

for (index, value) in arrSecond.enumerated() where value < 0 {
    countOfCycle = 0
    temp1 = arrSecond [countOfNegative]
    arrSecond [countOfNegative] = arrSecond[index]
    certainIndex = index
        for _ in (countOfNegative+1)..<certainIndex {
temp2 = arrSecond[certainIndex-countOfCycle]
            arrSecond[certainIndex-countOfCycle] = arrSecond[certainIndex-countOfCycle-1]
arrSecond[certainIndex-countOfCycle-1] = temp2
            countOfCycle += 1
    }
arrSecond[countOfNegative+1] = temp1
    countOfNegative += 1
}
print (arrSecond)


/////////////////////////////

 print ("Задание 3. Написать программу, определяющую сумму/количество положительных/ отрицательных элементов массива")
 var arrThird = [2, 8, 4, -5, 2, -1, 0, -40]
 print ("original array is \(arrThird)")
 var sumPositive = 0
 var countPositive = 0
 var sumNegative = 0
 var countNegative2 = 0
 for element in arrThird {
 if element >= 0 {
 sumPositive += element
 countPositive += 1
 }
//else if использовано для получения второго условия задачи: работа с отрицательными элементами массива
 else if element < 0 {
 sumNegative += element
 countNegative2 += 1
 }
 }
 print ("Sum of positive elements is \(sumPositive), quantity of positive elements is \(countPositive)")
 print ("Sum of negative elements is \(sumNegative), quantity of negative elements is \(countNegative2)")
 
///////////////////////////////
 print ("Задание 4. Сжать массив, удалив из него все 0, и заполнить освободившиеся справа элементы значениями -1. (не использовать встроенный remove, insert, append)")
 var arrFourth = [2, 8, 4, -5, 2, -1, 0, -40]
 print ("original array is \(arrFourth)")
 var numberOfZero = 0
 var tempFourth = 0
 for i in (0..<arrFourth.count)
 {
 if arrFourth[i] == 0 {
 numberOfZero += 1
 }
 else {
 tempFourth = arrFourth[i-numberOfZero]
 arrFourth[i-numberOfZero] = arrFourth[i]
 arrFourth[i] = tempFourth
 }
 }
 for i in (0...arrFourth.count-1) {
 if arrFourth[i] == 0 {
 arrFourth[i] = -1
 }
 }
 print ("new array is \(arrFourth)")

//////////////////////////////////////

 print ("Задание 5. Написать программу, определяющую сумму элементов массива, находящихся в массиве после первого элемента со значением 0.")
 var arrFifth = [2, 8, 4, -5, 0, -8, 0, 40]
 print ("original array is \(arrFifth)")
 var sumFifth = 0
 var keyIndex = 0
 for (index, element) in arrFifth.enumerated() {
 if element == 0 {
 keyIndex = index
 break
 
 }
 }
 for i in keyIndex..<arrFifth.count {
 sumFifth += arrFifth [i]
 
 }
 
 print ("Sum of elements after 0 is \(sumFifth)")

/////////////////////////////

 print ("Задание 5.6. Дан массив случайных чисел в диапазоне от -20 до +20. Необходимо найти позиции крайних отрицательных элементов (самого левого отрицательного элемента и самого правого отрицательного элемента) и отсортировать элементы, находящиеся между ними. ")
 var arrSixth = [16, -10, 4, 5, -1, -12, -19, -12]
 print ("original array is \(arrSixth)")
var leftNegative: Int! = 0
 var leftIndex = 0
var rightNegative: Int! = 0
 var rightIndex = 0
 var tempSixth = 0

 for (index, element) in arrSixth.enumerated () {
 if element < 0 {
 leftNegative = arrSixth[index]
 leftIndex = index
 print ("left negative index is \(leftIndex)")
 break
 }
 }
 for i in (0..<arrSixth.count).reversed () {
 if arrSixth[i] < 0 {
 rightNegative = arrSixth[i]
 rightIndex = i
 print ("right negative index is \(rightIndex)")
 break
 }
 }
var min = leftIndex + 1
if rightNegative != nil && leftNegative != nil && rightIndex != leftIndex && rightIndex-leftIndex != 1 {
    for _ in (leftIndex+1)..<rightIndex {
        for i in (leftIndex+1)..<rightIndex  {
            if arrSixth[i] > arrSixth[min] {
                tempSixth = arrSixth[i]
                arrSixth[i] = arrSixth[min]
                arrSixth[min] = tempSixth
            }
        }
        min += 1
    }
    print ("new array is \(arrSixth)")

} else if rightIndex - leftIndex == 1 {
    print ("array has not changed \(arrSixth)")
} else {
    print ("there no two negative numbers in array")
}


/////////////////////////////

 print ("Задание 5.7. Дан массив из 20 целых чисел со значениями от 1 до 20. Необходимо: создать случайное число из того же диапазона и найти позицию этого случайного числа в массиве; отсортировать элементы массива, находящиеся слева от найденной позиции по убыванию, а элементы массива, находящиеся справа от найденной позиции по возрастанию")
 var arrSeventh = [4, 6, 1, 8, 7, 19, 3, 2, 11, 13, 5, 9, 18, 10, 17, 16, 12, 14, 15, 20]
 print ("original array is \(arrSeventh)")
 var randomNumber = 5
print ("random number = \(randomNumber)")
 var indexRandomNumber = 0
 var minNumber = 0
 var temp = 0
 for (index, _) in arrSeventh.enumerated() {
 if arrSeventh[index] == randomNumber {
 indexRandomNumber = index
 print ("indexRandomNumber = \(indexRandomNumber)")
 }
 }
 for i in 0..<indexRandomNumber {
 if arrSeventh [i] < minNumber {
 minNumber = arrSeventh [i]
 }
 }
 for _ in 0..<indexRandomNumber {
 for i in 0..<indexRandomNumber {
 if arrSeventh[i] < arrSeventh[minNumber] {
 temp = arrSeventh[i]
 arrSeventh[i] = arrSeventh[minNumber]
 arrSeventh[minNumber] = temp
 }
 }
 minNumber += 1
 }
 
 for _ in indexRandomNumber...arrSeventh.count-1 {
 for i in indexRandomNumber...arrSeventh.count-1  {
 if arrSeventh[i] > arrSeventh[minNumber] {
 temp = arrSeventh[i]
 arrSeventh[i] = arrSeventh[minNumber]
 arrSeventh[minNumber] = temp
 }
 }
 minNumber += 1
 }
 print ("new array is \(arrSeventh)")
 

 
