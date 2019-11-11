//ДЗ 11 - Классы, наследование
/*Выполнил:    Вишневская Анастасия
 Группа:    iOS 19-2
 Дата сдачи:    11.11.2019
 */

//11.1 (3 балла) Создайте класс MyDate, который будет содержать информацию о дате (день, месяц, год).
//1. Сделать функцию установки даты setDate(day: Int, month: Int, year: Int).
//С помощью механизма перегрузки операторов, определите операции (К каждой
//операции сделать демонстрационный пример):
//2. Operator “ - “   - разность двух дат (результат в виде количества дней между датами),
//Operator “ + “   - операцию увеличения даты на определенное количество дней.
//3. Сравнения ==, !=, >, <

struct MyDate {
    var day : Int = 0
    var month : Int = 0
    var year : Int = 0
    init (day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }
    
    // преобразовать дату в число дней (без оператора)
    func dateAsNumber (date: MyDate) -> Int {
        var dateAsNumber : Int
        var temp = nameOfMonths(month: month)
        let key: Int = temp[1] as! Int
        dateAsNumber = day + month * key + year * 365
        return dateAsNumber
    }
    // определить название месяца
    // NONSTATIC
    func nameOfMonths (month : Int) -> [Any] {
        switch month {
        case 01 :
            return ["January", 31]
        case 02 :
            return ["February", 28]
        case 03 :
            return ["March", 31]
        case 04 :
            return ["April", 30]
        case 05 :
            return ["May", 31]
        case 06 :
            return ["June", 30]
        case 07 :
            return ["July", 31]
        case 08 :
            return ["August", 31]
        case 09 :
            return ["September", 30]
        case 10 :
            return ["October", 31]
        case 11 :
            return ["November", 30]
        case 12 :
            return ["December", 31]
        default:
            return ["There are only 12 months in a year."]
        }
    }
    
   //Static
    static func nameOfMonthsStatic (month : Int) -> [Any] {
        switch month {
        case 01 :
            return ["January", 31]
        case 02 :
            return ["February", 28]
        case 03 :
            return ["March", 31]
        case 04 :
            return ["April", 30]
        case 05 :
            return ["May", 31]
        case 06 :
            return ["June", 30]
        case 07 :
            return ["July", 31]
        case 08 :
            return ["August", 31]
        case 09 :
            return ["September", 30]
        case 10 :
            return ["October", 31]
        case 11 :
            return ["November", 30]
        case 12 :
            return ["December", 31]
        default:
            return ["There are only 12 months in a year."]
        }
    }
    
    // установить дату
    func setDate(myDate: MyDate) -> String {
        var fullDate = ""
        var statusOfDay = false
        var statusOfMonth = false
        var statusOfYear = false
        //проверка дня
        if day > 0 {
            switch month {
            case 1, 3, 5, 7, 8, 10, 12 :
                if day > 31 {
                    print ("It is 31 days in \((nameOfMonths(month: month))[0]). You enter invalid day.")
                }
                else if day > 0 || day < 32 {
                    statusOfDay = true
                }
            case 4, 6, 9, 11 :
                if day > 30 {
                    print ("It is 30 days in \((nameOfMonths(month: month))[0]). You enter invalid day.")
                }
                else if day > 0 || day < 31 {
                    statusOfDay = true
                    }
            case 2 :
                if day > 28 {
                    print ("It is 28 days in \((nameOfMonths(month: month))[0]). You enter invalid day.")
                }
                else if day > 0 || day < 29 {
                    statusOfDay = true
                }
            default:
                print ("Please, check your numbers.")
            }
        }
        else if day == 0 {
            print ("You should enter a day from 1 to 31.")
        }
        //проверка месяца
        if month > 0, month < 13 {
            statusOfMonth = true
        }
            else {
            print ("You should enter a month from 1 to 12.")
        }
        //проверка года
        if year >= 2000, year <= 2100 {
            statusOfYear = true
        }
        else {
            print ("Please, enter a year from 2000 to 2100.")
        }
        if statusOfDay == true, statusOfMonth == true, statusOfYear == true {
            fullDate = String(day) + "." + String(month) + "." + String(year)
        }
        else {
            print ("You did mistakes. Try again.")
        }
        return fullDate
    }
    
  // разница между датами, оператор -
    static func - (left : MyDate, right: MyDate) -> Int {
        var tempFirstDate = nameOfMonthsStatic(month: left.month)
        var tempSecondDate = nameOfMonthsStatic(month: right.month)
        let keyFirstDate: Int = tempFirstDate[1] as! Int
        let keySecondDate: Int = tempSecondDate[1] as! Int
        return (left.day - right.day + left.month * keyFirstDate - right.month * keySecondDate + (left.year - right.year) * 365)
    }
    
    //увеличение даты на определенное количество дней, оператор +
    static func + (left: MyDate, right: Int) -> MyDate{
        var dayNew = left.day + right
        var monthNew = left.month
        var yearNew = left.year
        while dayNew > (nameOfMonthsStatic(month: monthNew)[1] as! Int) {
            if dayNew > (nameOfMonthsStatic(month: left.month)[1] as! Int) {
            dayNew = dayNew - (nameOfMonthsStatic(month: monthNew)[1] as! Int)
                monthNew += 1
        }
        if monthNew > 12 {
            yearNew = left.year + 1
            monthNew = 1
        }
        }
        return MyDate (day: dayNew, month: monthNew, year: yearNew)
    }
    // сравнение ==
    static func == (left : MyDate, right: MyDate) -> Bool {
        return (left.day == right.day) && (left.month == right.month) && (left.year == right.year)
    }
    
    // сравнение !=
    static func != (left : MyDate, right: MyDate) -> Bool {
        return (left.day != right.day) || (left.month != right.month) || (left.year != right.year)
    }
    
    // больше >
    static func > (left : MyDate, right: MyDate) -> Bool {
        return (left - right) > 0
    }
    
    // меньше <
    static func < (left : MyDate, right: MyDate) -> Bool {
        return (left - right) < 0
    }
}


//ПРИМЕР

var dateFirst = MyDate(day: 01, month : 02, year : 2018)
print ("\(dateFirst.setDate(myDate: dateFirst))\n")
var dateSecond = MyDate(day: 10, month : 10, year : 2019)
print ("\(dateSecond.setDate(myDate: dateSecond))\n")


//Разница между датами

var difference = (dateSecond - dateFirst)
print ("1 VARIANT. Difference between two dates \(difference) days")

//Разница между датами (без оператора)

difference = (dateSecond.dateAsNumber(date: dateSecond)) - (dateFirst.dateAsNumber(date: dateFirst))
print ("2 VARIANT. Difference between two dates \(difference) days"
)

//Увеличение даты на определенное количество дней

var dateNew = MyDate(day: 0, month: 0, year : 0)
var certainQuantityOfDays = 366
dateNew = dateFirst + certainQuantityOfDays
print ("\(dateFirst.setDate(myDate: dateFirst)) + \(certainQuantityOfDays) = \(dateNew.setDate(myDate: dateNew))")

//Сравнение двух дат ==

if dateFirst == dateSecond {
    print ("There are equal dates: \(dateFirst.setDate(myDate: dateFirst)) and \(dateSecond.setDate(myDate: dateSecond))")
}
else {
    print ("There are not equal dates: \(dateFirst.setDate(myDate: dateFirst)) and \(dateSecond.setDate(myDate: dateSecond))")
}

//Сравнение двух дат !=

if dateFirst != dateSecond {
    print ("There are not equal dates: \(dateFirst.setDate(myDate: dateFirst)) and \(dateSecond.setDate(myDate: dateSecond))")
}
else {
    print ("There are equal dates: \(dateFirst.setDate(myDate: dateFirst)) and \(dateSecond.setDate(myDate: dateSecond))")
}

//больше >

if dateFirst > dateSecond {
    print ("First date \(dateFirst.setDate(myDate: dateFirst)) more than second date \(dateSecond.setDate(myDate: dateSecond))")
}
else {
    print ("Second date \(dateSecond.setDate(myDate: dateSecond)) more than first date \(dateFirst.setDate(myDate: dateFirst))")
}

if dateFirst < dateSecond {
    print ("First date \(dateFirst.setDate(myDate: dateFirst)) less than second date \(dateSecond.setDate(myDate: dateSecond))")
}
else {
    print ("Second date \(dateSecond.setDate(myDate: dateSecond)) less than first date \(dateFirst.setDate(myDate: dateFirst))")
}

//11.3 (4 балла ) Создать класс Point2D, с переменными x,y типа Double.
//Создать класс Point3D, который наследуется от Point2D и имеет дополнительную переменную z типа Double.
//
//Создать класс Shape c методом myPrint(), который ничего не выводит
//
//Создать класс (отрезок) Segment, который наследуется от Shape,
//Содержит в себе две точки a,b типа Point2D
//Объявить метод length(), который возвращает длину отрезка.
//Перегрузить метод myPrint(), Так, чтобы он выводил координаты точек и расстояние между ними.
//
//Создать класс Circle, который наследуется от Shape,
//Содержит в себе точку center : Point2D, radius: Double.
//
//Объявить метод area(), который возвращает площадь круга.
//Перегрузить метод myPrint(), Так, чтобы он выводил координаты центра, радиус и площадь.
//
//Аналогично классу Segment сделать класс Segment3D, который использует Point3D.

import Foundation
class Point2D {
    var x: Double = 0
    var y: Double = 0
}
class Point3D: Point2D {
    var z: Double = 0
}
class Shape {
    func myPrint(){
    }
}

class Segment : Shape {
    var a = Point2D()
    var b = Point2D()
    func length() -> Double {
        return sqrt((a.x - b.x)*(a.x - b.x)+(a.y - b.y)*(a.y - b.y))
}
    override func myPrint() {
        print ("Point a has coordinates x: \(a.x), y: \(a.y), point b - x: \(b.x), y: \(b.y). Length of these two points is \(length())")
    }
}

class Circle : Shape {
    var center = Point2D()
    var radius: Double = 0.00
    override func myPrint() {
        let areaOfCircle = pow(radius,2)*Double.pi
        print ("Circle has coordinates x: \(center.x), y: \(center.y). Radius is \(radius). Area of circle is \(areaOfCircle)")
    }
}

class Segment3D : Shape {
    var a = Point3D()
    var b = Point3D()
    func length() -> Double {
        return sqrt((a.x - b.x)*(a.x - b.x)+(a.y - b.y)*(a.y - b.y))
    }
    override func myPrint() {
        print ("Point a has coordinates x: \(a.x), y: \(a.y), point b - x: \(b.x), y: \(b.y). Length of these two points is \(length())")
    }
}
//Проверка
var point = Segment()
point.a.x = 6
point.a.y = 3
point.b.x = 5
point.b.y = 3
point.length()
point.myPrint()

var circle = Circle()
circle.center.x = 5
circle.center.y = 6
circle.radius = 5
circle.myPrint()


//11.2 (4 балла) Создать класс для работы с матрицами. Предусмотреть, как
//минимум, функции для
//сложения матриц, (+)
//умножения матриц, (*)
//транспонирования матриц, (вычисляемое свойство transposed)
//добавление матрицы к текущей, (+=)   (было присваивания матриц друг другу, (=))
//установка и получение произвольного элемента матрицы. (subscript [ ] )
//Необходимо определить соответствующие операторы.
	
