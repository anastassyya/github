/*Выполнил:     Вишневская Анастасия
 Группа:        iOS 19-2
 Дата сдачи:    20.10.2019 */

//(Set) (4 балла) Разработать игровое приложение Лото.

func enterNumberBegin () -> Int {
    var forcedValue = 0
    var status = false
    while status != true {
        if let input = readLine(){
            if let int = Int(input) {
                forcedValue = int
                status = true
                if forcedValue == 0 {
                    print ("Введите число от 1")
                    status = false
                }
            }
            else {
                print ("Введите число")
            }
        }
    }
    return forcedValue
}

func enterNumber (_ numberOfKegs: Int) -> Int {
    var forcedValue = 0
    var status = false
    while status != true {
        if let input = readLine(){
            if let int = Int(input) {
                forcedValue = int
                status = true
                if forcedValue == 0 {
                    print ("Введите число от 1")
                    status = false
                }
            }
            else {
                forcedValue = Int.random(in: 0..<numberOfKegs)
                status = true
            }
        }
    }
    return forcedValue
}

//функция заполнения чисел (рандомных) в билете (исходя из кол-ва чисел в билете)
func randomSetInTicket (_ quantityOfNumbersInTicket : Int, _ numberOfKegs : Int) -> Set<Int> {
    var arrayOfRandomElementsInTicket = Set <Int>()
    for _ in 0..<quantityOfNumbersInTicket{
        let randomInt = Int.random(in: 0..<numberOfKegs)
        arrayOfRandomElementsInTicket.insert(randomInt)
    }
    return arrayOfRandomElementsInTicket
}

//открытие следующего боченка
func openNextKeg (_ nextKeg : Int, _ numberOfKegsOnTheTable : inout Set<Int>, _ arrayOfKegs : inout Set<Int>) {

    numberOfKegsOnTheTable.insert(nextKeg)
    arrayOfKegs.remove(nextKeg)
}

print ("ЛОТО")
var status = false
print ("Введите максимальное количество чисел боченков")
let numberOfKegs = enterNumberBegin()

print ("Введите количество чисел в билете")
let quantityOfNumbersInTicket = enterNumberBegin()
let arrayOfNumbersInTicket : Set <Int> = Set (1...quantityOfNumbersInTicket)

print ("Введите количество игроков")
let numberOfPlayers = enterNumberBegin()
var arrayOfPlayers = [Set <Int>]()
var arrayOfPlayersChanged = [Set <Int>]()

// заполнение билетов игроков случайными числами
for _ in 0..<numberOfPlayers {
    arrayOfPlayers.append(randomSetInTicket (quantityOfNumbersInTicket, numberOfKegs))
    
}
for (player, _) in arrayOfPlayers.enumerated(){
    print (arrayOfPlayers[player])
}


//боченки в мешке
print ("СТАРТ!!! В мешке боченки от 1 до \(numberOfKegs)")
var arrayOfKegs: Set <Int> = Set (1...numberOfKegs)
print (arrayOfKegs)

//боченки на столе
var numberOfKegsOnTheTable = Set <Int>()

var nextKeg = 0

//проверка цифр в билетах
while status == false {
    print ("Открыть следующий боченок! Введи номер. Или просто нажми Enter")
    nextKeg = enterNumber(numberOfKegs)
    if nextKeg > numberOfKegs {
        print ("Ты мухлюешь. В мешке нет такого боченка!!!")
    }
    else {
    openNextKeg (nextKeg, &numberOfKegsOnTheTable, &arrayOfKegs)
    print ("На столе: \(numberOfKegsOnTheTable)")
    arrayOfPlayersChanged = []
    var difference = 0
        for (index, value) in arrayOfPlayers.enumerated(){
        arrayOfPlayersChanged.append(value.subtracting(numberOfKegsOnTheTable))
        difference = arrayOfPlayers[index].count - arrayOfPlayersChanged[index].count
            print ("\(index+1):\(value) - Открыто: \(difference) из \(quantityOfNumbersInTicket) - осталось: \(arrayOfPlayersChanged[index])")
            if arrayOfPlayersChanged[index].isEmpty {
                status = true
                print ("==WINNER")
    }
}
    print ("В мешке: \(arrayOfKegs)")
}
    
}
print ("!!!ИГРА ОКОНЧЕНА!!!")



//7.2. (Dictionary) (2 балла)  Написать функцию, которая считает количество каждого символа в введенной строке. Выдать результат работы функции в таком виде: \"Мама мыла раму!\""

var expression = readLine()!
var characters = [Character: Int]()
for i in expression {
    if characters [i] != nil {
        characters[i]! += 1
    }
    else {
        characters [i] = 1
    }
}
for (index, value) in characters {
    print ("\(index): \(value)")
}


