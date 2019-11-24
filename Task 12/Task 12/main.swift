//
//  main.swift
//  Task 12
//
//  Created by Анастасия Вишневская on 11/23/19.
//  Copyright © 2019 Anastasiya Vishnevskaya. All rights reserved.
//

import Foundation

//
//12.1 (2 балла)
//* Создать базовый класс Employer (служащий) со свойством name:
//String и с функцией getDescription, которая возвращает String.
//* Создайте три дочерних класса: President, Manager, Worker.     Переопределите функцию getDescription для вывода информации, соответствующей каждому типу служащего.
//* Создать массив var employers [Employer]. Заполнить его различными служащими.
//Распечатать информацию о всех служащих из массива в одном цикле.


class Employer {
    var name: String
    init (name: String) {
        self.name = name
    }
    func getDescription() -> String {
        return "Employer's name is \(name)"
    }
}

class President: Employer {
    override func getDescription() -> String {
        return "President's name is \(name)"
    }
}


class Manager: Employer {
    override func getDescription() -> String {
        return ("Manager's name is \(name)")
    }
}

class Worker: Employer {
    override func getDescription() -> String {
        return "Worker's name is \(name)"
    }
}

var employers: [Employer] = []
employers.append (Worker (name: "Oleg"))
employers.append (Worker (name: "Sergey"))
employers.append (Worker (name: "Evgeniy"))
employers.append (Manager (name: "Alex"))
employers.append (Manager (name: "Igor"))
employers.append (President (name: "Vladimir"))

for employer in employers {
    print (employer.getDescription())
}


//*12.2 (2 балла)
// * Создайте класс Passport (паспорт), который будет содержать паспортную информацию о гражданине Украины.
// * С помощью механизма наследования, реализуйте класс ForeignPassport (загран. паспорт) производный от Passport. Напомним, что загран.паспорт помимо паспортных данных,  содержит данные о визах.
// * Сделать вычисляемое свойство только для чтения description, которое возвращает String с паспортными данными
// * Создать массив var passports: [Passport]. Заполнить его различными паспортами.
// Распечатать информацию о всех паспортах из массива в одном цикле.


class Passport {
    var idNumber : Int
    var name : String
    var surname : String
    var dateOfBirth : String
    var placeOfBirth : String
    var address : String
    init (idNumber: Int, name: String, surname: String, dateOfBirth: String, placeOfBirth: String, address: String) {
        self.idNumber = idNumber
        self.name = name
        self.surname = surname
        self.dateOfBirth = dateOfBirth
        self.placeOfBirth = placeOfBirth
        self.address = address
    }
    var description : String {
        let output = "The passport of \(surname) \(name) with id \(idNumber). Date of birth is \(dateOfBirth). Place of birth is \(placeOfBirth). The address is \(address)"
        return output
    }
    
}

class ForeignPassport : Passport {
    var visa : [String]?
    init (idNumber: Int, name: String, surname: String, dateOfBirth: String, placeOfBirth: String, address: String, visa: [String]){
        self.visa = visa
        super.init(idNumber: idNumber, name: name, surname: surname, dateOfBirth: dateOfBirth, placeOfBirth: placeOfBirth, address: address)
    }
    override var description : String {
        var output : String
        if let myVisa = visa {
            output = super.description + ". Information about visas : \(myVisa)"
        } else {
            output = super.description + ". Information about visas is absent"
        }
        return output
        
    }
}

//Check

var myPassport = ForeignPassport(idNumber: 111111, name: "Oleg", surname: "Ivanov", dateOfBirth: "01.01.1990", placeOfBirth: "Dnepr", address: "Dnepr, str. Malinovskogo, h. 5, app. 1", visa: [])
print (myPassport.description)
myPassport.visa = ["31.12.2018, Poland", "01.03.2019, Germany"]
print (myPassport.description)

var passports: [Passport] = []
passports.append(Passport(idNumber: 222222, name: "Anna", surname: "Petrova", dateOfBirth: "10.10.1980", placeOfBirth: "Kiev", address: "Kiev, str. Zavodskaya, h. 10, app. 4"))
passports.append(ForeignPassport(idNumber: 754737, name: "Anna", surname: "Petrova", dateOfBirth: "10.10.1980", placeOfBirth: "Kiev", address: "Kiev, str. Zavodskaya, h. 10, app. 4", visa: ["01.12.2019, USA"]))
passports.append(Passport(idNumber: 959595, name: "Igor", surname: "Smirnov", dateOfBirth: "30.05.1985", placeOfBirth: "Kharkiv", address: "Kharkiv, str. Dostoevskogo, h. 20, app. 10"))
passports.append(ForeignPassport(idNumber: 273774, name: "Igor", surname: "Smirnov", dateOfBirth: "30.05.1985", placeOfBirth: "Kharkiv", address: "Kharkiv, str. Dostoevskogo, h. 20, app. 10", visa: ["20.07.2015, USA", "20.01.2017, France"]))

for passport in passports {
    print (passport.description)
}



//12.3.1 (2 балла). Сделать класс Человек, у этого класса будут проперти Папа, Мама, Братья, Сестры (всё опционально). (братья и сестры сделать одним массивом)
//Сделать примерно 20 человек, взять одного из них, поставить ему Папу/Маму.
//Папе и Маме поставить Пап/Мам/Братьев/Сестер. Получится большое дерево иерархии.
//Посчитать, сколько у этого человека двоюродных Братьев, троюродных Сестёр, Теть, Дядь, итд

//12.3.2 (2 балла) Все сестры, матери,... должны быть класса Женщина, Папы, братья,... класса Мужчины.
//У Мужчин сделать метод Двигать_диван, у Женщин Дать_указание (двигать_диван). Всё должно работать как и ранее.
//Всех этих людей положить в массив Семья, пройти по массиву посчитать количество Мужчин и Женщин, для каждого Мужчины вызвать метод Двигать_диван, для каждой женщины Дать_указание.
//
//12.3.3 (2 балла). Расширить класс человек, у него будет проперти Домашние_животные.
//Животные могут быть разные (попугаи, кошки, собаки...) их может быть несколько, может и не быть вообще.
//Раздать некоторым людям домашних животных. Пройти по всему массиву людей.
//Проверить каждого человека на наличие питомца, если такой есть - добавлять всех животных в массив животных.
//Посчитать сколько каких животных в этом массиве.
//Вся эта живность должна быть унаследована от класса Животные. У всех животных должен быть метод Издать_звук(крик) и у каждого дочернего класса этот метод переопределён на свой, т.е. каждое животное издаёт свой звук.
//Когда проходим по массиву животных, каждый представитель вида животных должен издать свой звук.
//
//Обязательно используем в заданиях Опциональные цепочки(Optional chaining) и Приведение типов (Type casting)

class Animal {
    var name: String
    init (name: String) {
        self.name = name
    }
    func scream () -> String {
    return ""
    }
}

class Dog: Animal {
    override func scream() -> String {
        return "gav"
    }
}

class Cat: Animal {
    override func scream() -> String {
        return "myau"
    }
}

class Bird: Animal {
    override func scream() -> String {
        return "chik-chirik"
    }
}

class Woman: Human {
    func giveOrder () {
        print ("Move sofa!")
    }
}

class Man: Human {
    func moveSofa () {
        print ("ok")
    }
}

class Human {
    var mother : Human?
    var father : Human?
    var siblings : [Human]?
    var children : [Human]?
    var animal : Animal?
    init (animal: Animal?) {
        self.animal = animal
    }
    init (mother : Human?, father : Human?, siblings : [Human]?, children: [Human]?){
        self.mother = mother
        self.father = father
        self.siblings = siblings
        self.children = children
    }
    init () {}
    
    
    func setRelatives(mother: Human, father: Human, siblings: [Human], children: [Human]) {
        self.mother = mother
        self.father = father
        self.siblings = siblings
        self.children = children
    }
    
    func nameMember () -> Human {
        return self
    }
    
    func quantityOfRelatives() -> String {
        var countOfAuntsAndUncles = 0
        var countOfFirstCousins = 0
        var countOfSecondCousins = 0
        
        
        if self.mother?.siblings?.isEmpty != true || self.father?.siblings?.isEmpty != true {
            if let quantityOfSiblingsOfMother = self.mother?.siblings?.count, let quantityOfSiblingsOfFather = self.father?.siblings?.count {
                countOfAuntsAndUncles = quantityOfSiblingsOfMother + quantityOfSiblingsOfFather
            }
            
        }
        
        if let siblings = self.mother?.siblings {
            for sibling in siblings {
                if let countChildren = sibling.children?.count {
                    countOfFirstCousins += countChildren
                }
            }
        }
        if let siblings = self.father?.siblings {
            for sibling in siblings {
                if let countChildren = sibling.children?.count {
                    countOfFirstCousins += countChildren
                }
            }
        }
        
        
        if let siblingsOfMyGranddad = self.father?.father?.siblings {
            for siblingOfMyGranddad in siblingsOfMyGranddad {
                if let nephewsOfMyGranddad = siblingOfMyGranddad.children {
                    for nephewOfMyGranddad in nephewsOfMyGranddad {
                        if let countChildrenOfNephews = nephewOfMyGranddad.children?.count {
                            countOfSecondCousins += countChildrenOfNephews
                        }
                    }
                }
            }
        }
        if let siblingsOfMyGrandMother = self.mother?.father?.siblings {
            for siblingOfMyGrandMother in siblingsOfMyGrandMother {
                if let nephewsOfMyGrandMother = siblingOfMyGrandMother.children {
                    for nephewOfMyGrandMother in nephewsOfMyGrandMother {
                        if let countChildrenOfNephews = nephewOfMyGrandMother.children?.count {
                            countOfSecondCousins += countChildrenOfNephews
                        }
                    }
                }
            }
        }
        
        return ("aunt and uncles : \(countOfAuntsAndUncles), first cousins : \(countOfFirstCousins), second cousins : \(countOfSecondCousins)")
    }
}

//create human
var alena: Woman = Woman(mother : nil, father : nil, siblings : nil, children : nil)
var evgeniy: Man = Man(mother : nil, father : nil, siblings : nil, children : nil)
var katerina: Woman = Woman(mother : nil, father : nil, siblings : nil, children : nil)
var anatoliy: Man = Man(mother : nil, father : nil, siblings : nil, children : nil)
var nikolay: Man = Man(mother : nil, father : nil, siblings : nil, children : nil)
var elena: Woman = Woman(mother : nil, father : nil, siblings : nil, children : nil)
var vasiliy: Man = Man(mother : nil, father : nil, siblings : nil, children : nil)
var olga: Woman = Woman(mother : nil, father : nil, siblings : nil, children : nil)
var ivan: Man = Man(mother : nil, father : nil, siblings : nil, children : nil)
var anton: Man = Man(mother : nil, father : nil, siblings : nil, children : nil)
var vyacheslav: Man = Man(mother : nil, father : nil, siblings : nil, children : nil)
var sergey: Man = Man(mother : nil, father : nil, siblings : nil, children : nil)
var margarita: Woman = Woman(mother : nil, father : nil, siblings : nil, children : nil)
var alexey: Man = Man(mother : nil, father : nil, siblings : nil, children : nil)
var marina: Woman = Woman(mother: nil, father: nil, siblings: nil, children : nil)
var mihail: Man = Man(mother: nil, father: nil, siblings: nil, children : nil)
var alexandr: Man = Man(mother: nil, father: nil, siblings: nil, children : nil)
var oleg: Man = Man(mother: nil, father: nil, siblings: nil, children : nil)
var anna: Woman = Woman(mother: nil, father: nil, siblings: nil, children : nil)
var tatyana: Woman = Woman(mother: nil, father: nil, siblings: nil, children : nil)
var igor: Man = Man(mother: nil, father: nil, siblings: nil, children : nil)

//set relatives
alena.setRelatives (mother: katerina, father: anatoliy, siblings: [], children : [])
katerina.setRelatives (mother: elena, father: vasiliy, siblings: [nikolay, evgeniy, margarita], children : [alena])
anatoliy.setRelatives (mother: olga, father: vyacheslav, siblings: [sergey, alexey, anton], children : [alena])
nikolay.setRelatives (mother: elena, father: vasiliy, siblings: [evgeniy, margarita, ivan, katerina], children: [alexandr, mihail])
vasiliy.setRelatives(mother: marina, father: ivan, siblings: [oleg], children: [katerina, nikolay, evgeniy, margarita])
oleg.setRelatives(mother: marina, father: ivan, siblings: [vasiliy], children: [anna])
anna.setRelatives(mother: tatyana, father: oleg, siblings: [], children: [igor])


print ("Alena has \(alena.quantityOfRelatives())")

//check functions
alena.giveOrder()
nikolay.moveSofa()

var family = [igor, tatyana, anna, oleg, alexandr, mihail, marina, alexey, margarita, sergey, vyacheslav, anton, ivan, olga, vasiliy, elena, nikolay, katerina, anatoliy, evgeniy, alena]
var countMen = 0
var countWomen = 0


for member in family {
    if let man = member as? Man {
        countMen += 1
        print ("\(member) says")
        man.moveSofa()
        
    }
    else if let woman = member as? Woman {
        countWomen += 1
        print ("\(member) says")
        woman.giveOrder()
    }
}
print ("quantity of men is \(countMen), quantity of women is \(countWomen)")


//extension Human {
//    struct Holder {
//        static var _animal : Animal?
//    }
//    var animal : Animal? {
//        set {
//            Holder._animal = newValue
//        }
//        get  {
//            return Holder._animal
//        }
//    }
// }

    
alena.animal = Dog(name: "dog")
igor.animal = Cat(name: "cat")
katerina.animal = Bird(name: "parrot")
elena.animal = Dog(name: "puppy")
nikolay.animal = Bird(name: "bird")

var animals = [Animal]()
var countBirds = 0
var countCats = 0
var countDogs = 0

for member in family {
    if let homeAnimal = member.animal as? Bird {
        animals.append(homeAnimal)
        print ("\(homeAnimal.name) says \(homeAnimal.scream())")
        countBirds += 1
        }
    if let homeAnimal = member.animal as? Cat {
        animals.append(homeAnimal)
        print ("\(homeAnimal.name) says \(homeAnimal.scream())")
        countCats += 1
    }
    if let homeAnimal = member.animal as? Dog {
        animals.append(homeAnimal)
        print ("\(homeAnimal.name) says \(homeAnimal.scream())")
        countDogs += 1
    }
}
print ("quantity of birds is \(countBirds), quantity of cats is \(countCats), quantity of dogs is \(countDogs)")



