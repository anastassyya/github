
/*Выполнил:    Вишневская Анастасия
 Группа:    iOS 19-2
 Дата сдачи:    05.09.2019
 */

///*
// 2.1. Создать пять строковых констант
// Одни константы это только цифры, другие содержат еще и буквы
// Найти сумму всех этих констант приведя их к Int
// (Используйте и optional binding  и forced unwrapping)
// */
//
//// forced unwraps
//let a = ["23", "54a", "76a", "85y", "26"]
//var sum = 0
//for i in a {
//    if Int (i) != nil {
//        sum += Int (i)!
//    }
//}
//print (sum)
//

// optional binding
//let a = ["23", "54a", "76a", "85y", "26"]
//var sum = 0
//for i in a {
//    if let b = Int (i) {
//        sum += b
//
//    }
//}
//print (sum)
//
//
//


//2.2. С сервера к нам приходит тюпл с тремя параметрами:
//statusCode, message, errorMessage (число, строка и строка)
//в этом тюпле statusCode всегда содержит данные, но сама строка приходит только в одном поле
//если statusCode от 200 до 300 исключительно, то выводите message,
//в противном случает выводите errorMessage
//После этого проделайте тоже самое только без участия statusCode
//
//(Примеры тюплов: (200, "ok", nil), (404, nil, "server not found") )
//Если входной тюпл: (statusCode : 200, message : "OK", errorMessage : "")
//
//На экран должно вывестись: Данные получены корректно. message: "ok"
//
//или входной тюпл: (statusCode: 404, message: nil, errorMessage: "server not found")
//На экран должно вывестись: Данные получены не корректно. statusCode: 404, errorMessage: "server not found"
//*/

var tuples = (statusCode: 200, message: "OK", errorMessage: "nil")
if tuples.statusCode >= 200 && tuples.statusCode <= 300 {
    print ("We received correct data. message: \(tuples.message)")
} else {
    print ("We don’t received correct data. statusCode: \(tuples.statusCode), errorMessage: \(tuples.errorMessage)")
}

tuples = (statusCode: 404, message: "nil", errorMessage: "server not found")
if tuples.statusCode >= 200 && tuples.statusCode <= 300 {
    print ("We received correct data. message: \(tuples.message)")
} else {
    print ("We don’t received correct data. statusCode: \(tuples.statusCode), errorMessage: \(tuples.errorMessage)")
}

/*2.3. Создайте 5 тюплов с тремя параметрами:
 имя, номер машины, оценка за контрольную
 при создании этих тюплов не должно быть никаких данных
 после создания каждому студенту установите имя
 некоторым установите номер машины
 некоторым установите результат контрольной
 выведите в консоль:
 - имена студента
 - есть ли у него машина
 - если да, то какой номер
 - был ли на контрольной
 если да, то какая оценка.
 */


var student1 : (name: String, car: String?, mark: Int?)
var student2 : (name: String, car: String?, mark: Int?)
var student3 : (name: String, car: String?, mark: Int?)
var student4 : (name: String, car: String?, mark: Int?)
var student5 : (name: String, car: String?, mark: Int?)
student1 = ("Alex", "ВС6280НА", 5)
student2 = ("Igor", nil, 4)
student3 = ("Oleg", "АН6286АР", nil)
student4 = ("Sasha", nil, nil)
student5 = ("Vova", "ВВ8163МВ", 2)
let listOfSTudents = [student1, student2, student3, student4, student5]
print (student1.name, student2.name, student3.name, student4.name, student5.name, separator: ", ")
if student1.car != nil {
    print (student1.name, student1.car!, separator: " has a car ")
}
if student2.car != nil {
    print (student2.name, student2.car!, separator: " has a car ")
}
if student3.car != nil {
    print (student3.name, student3.car!, separator: " has a car ")
}
if student4.car != nil {
    print (student4.name, student4.car!, separator: " has a car ")
}
if student5.car != nil {
    print (student5.name, student5.car!, separator: " has a car ")
}

if student1.mark != nil {
    print (student1.name, student1.mark!, separator: " was on the exam and got a mark ")
}
if student2.mark != nil {
    print (student2.name, student2.mark!, separator: " was on the exam and got a mark ")
}
if student3.mark != nil {
    print (student3.name, student3.mark!, separator: " was on the exam and got a mark ")
}
if student4.mark != nil {
    print (student4.name, student4.mark!, separator: " was on the exam and got a mark ")
}
if student5.mark != nil {
    print (student5.name, student5.mark!, separator: " was on the exam and got a mark ")
}








/*2.4 Создайте псевдоним типа String с именем Text .
 Создайте псевдоним для типа (numberOne: Text?, numberTwo: Text?)? с именем TupleType .
 Данный тип является опциональным и также содержит в себе опциональные значения .
 Создайте три переменные типа TupleType, содержащие следующие значения: ("190", "67"), ("100", nil), ("-65", "70").
 Выведите значения элементов тех тюплов, в которых ни один из элементов не инициализирован как nil .
 */

typealias Text = String
typealias TupleType = (numberOne: Text?, numberTwo: Text?)
var a: TupleType = ("190", "67")
var b: TupleType = ("100", nil)
var c: TupleType = ("-65", "70")


if a.0 != nil && a.1 != nil {
    print (a)
}

if b.0 != nil && b.1 != nil {
    print (b)
}

if c.0 != nil && c.1 != nil {
    print (c)
}

/*СТРОКИ
 
 2.5. Выполните задание 2.1.
 только вместо forced unwrapping и optional binding используйте оператор ??
 
 Когда посчитаете сумму, то представьте свое выражение в виде строки
 Например: 5 + nil + 2 + 3 + nil = 10
 
 но в первом случае используйте интерполяцию строк, а во втором конкатенацию
 */

// nil-coalescing operator
//
let a = ["23", "54a", "76a", "85y", "26"]
var y = 0
var sum = 0
for i in a {
    y = Int (i) ?? 0
    print (y, terminator: "+")
    sum += y
}

print ("=\(sum)")



/*2.6. Поиграйтесь с юникодом и создайте строку из 5 самых классных по вашему мнению символов,
 можно использовать составные символы. Посчитайте длину строки
 */

var a: Character = "\u{2230}"
var b: Character = "\u{2317}"
var c: Character = "\u{263a}"
var d: Character = "\u{2460}"
var e: Character = "\u{25EF}"
var sum = String (a) + String (b) + String (c) + String (d) + String (e)
print ("all is \(sum); elements are \(sum.count)")



/*2.7. Создайте строку английский алфавит, все буквы малые от a до z
 задайте константу - один из символов этого алфавита
 Используя цикл for определите под каким индексов в строке находится этот символ
 */

var a = "abcdefghijklmnopqrstuvwxyz"
let b: Character = "k"
let c = a.index(of: "k")
let i = c?.encodedOffset       // i will be an Int. You need "?" because it might be nil, no such character found.

if i != nil {                   // You MUST deal with the optional, unwrap it only if not nil.
    print("i = ",i!)            // "!" str1ps off "optional" specification (unwraps i).
}

