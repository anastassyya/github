
/*Выполнил:    Вишневская Анастасия
 Группа:    iOS 19-2
 Дата сдачи:    05.09.2019
 */

/*1. Посчитать количество секунд от начала года до вашего дня рождения. Игнорируйте високосный год и переходы на летнее и зимнее время.
 */

var myBirthday = (18, 5)
var happyNewYear = (1, 1)
var sum : Int = 0
var i: Int = myBirthday.1 - 1
for months in 1...i {
    if i == 1 || i == 3 || i == 5 || i == 7 || i == 8 || i == 10 || i == 12 {
        sum = sum + 31
    }
    else if i == 2 {
        sum += 28
    } else {
        sum += 30
    }
}
let result = (myBirthday.0 - happyNewYear.0 + sum) * 24 * 60 * 60
print (result)


//2. Посчитайте в каком квартале вы родились

var myBirthDay = (10, 2)
var decade : Int = 0

var y = myBirthDay.1
if y != 0 && y <= 3 {
    decade = 1
} else if y >= 4 && y <= 6 {
    decade = 2
} else if y >= 7 && y <= 9 {
    decade = 3
} else if y >= 10 && y <= 12 {
    decade = 4
} else {
    print ("you enter invalid data")
}
print ("your decade is \(decade)")

//3. Создайте пять переменных типа Инт и добавьте их в выражения со сложением, вычитанием, умножением и делением. В этих выражениях каждая из переменных должна иметь при себе унарный постфиксный или префиксный оператор. Переменные могут повторяться.
//
//Убедитесь что ваши вычисления в голове или на бумаге совпадают с ответом. Обратите внимание на приоритет операций
//
//4. Шахматная доска 8х8. Каждое значение в диапазоне 1…8. При заданных двух значениях по вертикали и горизонтали определите цвет поля. Если хотите усложнить задачу, то вместо цифр на горизонтальной оси используйте буквы a,b,c,d,e,f,g,h

let chess = (x : 6, y : 5)
if chess.x % 2 == chess.y % 2 {
    print ("black cell")
} else {
    print ("white cell")
}
