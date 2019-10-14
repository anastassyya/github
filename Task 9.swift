/*Выполнил: Вишневская Анастасия
Группа: IOS 19-2
Дата сдачи: 14.10.19
*/
//Exercise - Structs, Instances, and Default Values
 /*
 Imagine you are creating some kind of app for monitoring location. Create a `GPS` struct with two variable properties, latitude and longitude, both with default values of 0.0.
 */
struct GPS {
    var latitude: Double = 0.0
    var longitude: Double = 0.0
}

/*:
 Create a variable instance of `GPS` called `somePlace`. It should be initialized without supplying any arguments. Print out the latitude and longitude of `somePlace`, which should be 0.0 for both.
 */
var somePlace = GPS()
print(somePlace)

/*:
 Change `somePlace`'s latitude to 51.514004, and the longitude to 0.125226, then print the updated values.
 */
somePlace.latitude = 51.514004
somePlace.longitude = 0.125226
print(somePlace)

/*:
 Now imagine you are making a social app for sharing your favorite books. Create a `Book` struct with four variable properties: `title`, `author`, `pages`, and `price`. The default values for both `title` and `author` should be an empty string. `pages` should default to 0, and `price` should default to 0.0.
 */
struct Book {
var title: String = ""
var author : String = ""
var pages : Int = 0
var price : Double = 0.0
}

/*:
 Create a variable instance of `Book` called `favoriteBook` without supplying any arguments. Print out the title of `favoriteBook`. Does it currently reflect the title of your favorite book? Probably not. Change all four properties of `favoriteBook` to reflect your favorite book. Then using the properties of `favoriteBook`, print out facts about the book.
*/

var favouriteBook = Book()
print (favouriteBook.title)

favouriteBook.title = "The Million Pound Bank Note"
favouriteBook.author = "Mark Twain"
favouriteBook.pages = 96
favouriteBook.price = 5
print (favouriteBook)

/*:
 ## App Exercise - Workout Tracking
 
 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 Your fitness tracking app wouldn't be much of a fitness tracker if it couldn't help users track their workouts. In order to track a user's run, you'll need to have some kind of data structure that can hold information about the workout. For the sake of simplicity, you'll focus specifically on running workouts.
 
 Create a `RunningWorkout` struct. It should have variables properties for `distance`, `time`, and `elevation`. All three properties should have default values of 0.0.
 */
 
struct RunningWorkout {
var distance : Double = 0.0
var time : Double = 0.0
var elevation : Double = 0.0
}


/*:
 Create a variable instance of `RunningWorkout` called `firstRun` without supplying any arguments. Print out all three properties of `firstRun`. This is a good example of when using default values is appropriate, seeing as all running workouts start with a distance, time, and elevation change of 0.
 */
var firstRun = RunningWorkout()
print (firstRun)


/*:
 Now imagine that throughout the course of the run, you go a distance of 2396 meters in 15.3 minutes, and gain 94 meters of elevation. Update the values of `firstRun`'s properties accordingly. Print a statement about your run using the values of each property.
 */
firstRun.distance = 2396
firstRun.time = 15.3
firstRun.elevation = 94
print ("current distance \(firstRun.distance)")
print ("time for implementation \(firstRun.time)")
print ("current elevation \(firstRun.elevation)")


/*:
 ## Exercise - Memberwise and Custom Initializers
 
 If you completed the exercise Structs, Instances, and Default Values, you created a `GPS` struct with default values for properties of `latitude` and `longitude`. Create your `GPS` struct again, but this time do not provide default values. Both properties should be of type `Double`.
 */
struct GPSNEW {
var latitude: Double
var longitude: Double
}

/*:
 Now create a constant instance of `GPS` called `somePlace`, and use the memberwise initializer to set `latitude` to 51.514004, and `longitude` to 0.125226. Print the values of `somePlace`'s properties.
 */
var somePlaceNew = GPSNEW(latitude: 51.514004, longitude: 0.125226)
print (somePlaceNew)

/*:
 In Structs, Instance, and Default Values, you also created a `Book` struct. Creat this struct again without default values. Give each property appropriate types. Declare your `favoriteBook` instance and pass in the values of your favorite book using the memberwise initializer. Print a statement about your favorite book using `favoriteBook`'s properties.
 */
struct BookNew {

var title: String
var author : String
var pages : Int
var price : Double

}


var favouriteBookNew = Book(title : "The Million Pound Bank Note", author : "Mark Twain", pages : 96, price : 5)
print (favouriteBookNew.title)
print (favouriteBookNew.author)
print (favouriteBookNew.pages)
print (favouriteBookNew.price)


/*:
 Make a `Height` struct with two variable properties, `heightInInches` and `heightInCentimeters`. Both should be of type `Double`.
 
 Create two custom initializers. One initializer will take a `Double` argument that represents height in inches. The other initializer will take a `Double` argument that represents height in centimeters. Each initializer should take the passed in value and use it to set the property that corresponds to the unit of measurement passed in. It should then set the other property by calculating the right value from the passed in value. Hint: *1 inch = 2.54 centimeters*.
 
 - Example: If you use the initializer for inches to pass in a height of 65, the initializer should set `heightInInches` to 65 and `heightInCentimeters` to 165.1.
 */
struct Height {
var heightInInches : Double
var heightInCentimeters : Double

init (heightInInches : Double){
self.heightInInches = heightInInches
heightInCentimeters = heightInInches*2.54
}

init (heightInCentimeters : Double){
self.heightInCentimeters = heightInCentimeters
heightInInches = heightInCentimeters/2.54
}
}

var newVariable = Height(heightInCentimeters: 2)
print (newVariable)


/*:
 Now create a variable instance of `Height` called `someonesHeight`. Use the initializer for inches to set the height to 65. Print out the property for height in centimeters and verify that it is equal to 165.1.
 */
var someonesHeight = Height(heightInInches: 65)
print (someonesHeight.heightInCentimeters)


/*:
 Now create a variable instance of `Height` called `myHeight` and initialize it with your own height. Verify that both `heightInInches` and `heightInCentimeters` are accurate.
 */
var myHeight = Height(heightInCentimeters : 160)


///////////////////////
/*:
 ## App Exercise - Users and Distance
 
 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 For most apps you'll need to have a data structure to hold information about a user. Create a `User` struct that has properties for basic information about a user. At a minimum, it should have properties to represent a user's name, age, height, weight, and activity level. You could do this by having `name` be a `String`, `age` be an `Int`, `height` and `weight` be of type `Double`, and `activityLevel` be an `Int` that will represent a scoring 1-10 of how active they are. Implement this now.
 */

struct User {
    var name : String
    var age : Int
    var height : Double
    var weight : Double
    var activityLevel : Int
}


/*:
 Create a variable instance of `User` and call it your name. Use the memberwise initializer to pass in information about yourself. Then print out a description of your `User` instance using the instance's properties.
 */
var Anastasiia = User(name : "Anastasiia", age: 30, height : 160, weight : 48, activityLevel : 8  )
print (Anastasiia)

/*:
 In previous app exercises, you've worked with distance in the fitness tracking app example as a simple number. However, distance can be represented using a variety of units of measurement. Create a `Distance` struct that will represent distance in various units of measurement. At a minimum, it should have a `meters` property and a `feet` property. Create a custom initializer corresponding to each property (i.e. if you only have the two properties for meters and feet you will then have two initializers) that will take in a distance in one unit of measurement and assign the correct value to both units of measurements. Hint: *1 meter = 3.28084 feet*.
 
 - Example: If you use the initializer for meters and pass in a distance of 1600, the initializer should set `meters` to 1600 and `feet` to 5249.344.
 */

struct Distance {
    var meter : Double
    var feet : Double
    var kilometre : Double
    var mile : Double
 
init (meter: Double){
    self.meter = meter
    feet = 3.28084*meter
    kilometre = 0.001*meter
    mile = 0.00062*meter
}

init (feet: Double) {
   self.feet = feet
   meter = 0.3048*feet
   kilometre = 0.0003048*feet
   mile = 0.000189*feet
  
}

init (kilometre: Double){
    self.kilometre = kilometre
    feet = 3280.84*kilometre
    meter = 1000*kilometre
    mile = 0.62137*kilometre
}

init (mile: Double){
    self.mile = mile
    feet = 5280.10983*mile
    meter = 1609.35*mile
    kilometre = 1.60935*mile
}
    
}    


/*:
 Now create an instance of `Distance` called `mile`. Use the initializer for meters to set the distance to 1600. Print out the property for feet and verify that it is equal to 5249.344.
 */
var mile = Distance (meter: 1600)
print (mile)

/*:
 Now create another instance of `Distance` and give it some other distance. Ensure that both properties are set correctly.
 */
var meter = Distance (feet: 5)
print (meter)

/*:
 ## Exercise - Methods
 
 A `Book` struct has been created for you below. Add an instance method on `Book` called `description` that will print out facts about the book. Then create an instance of `Book` and call this method on that instance.
 */
struct NextBook {
    var title: String
    var author: String
    var pages: Int
    var price: Double
    func description(){
        print ("Details about the book : 1) title : \(title), 2) author : \(author), 3) pages : \(pages), 4) price : \(price)")
    }
}

var myNewBook = NextBook(title : "English Grammar", author : "John Eastwood", pages : 1200, price : 20)
myNewBook.description()

/*:
 A `Post` struct has been created for you below, representing a generic social media post. Add a mutating method on `Post` called `like` that will increment `likes` by one. Then create an instance of `Post` and call `like()` on it. Print out the `likes` property before and after calling the method to see whether or not the value was incremented.
 */
struct Post {
    var message: String = ""
    var likes: Int = 0
    var numberOfComments: Int = 0
    mutating func like (){
        likes += 1
    }
}
var like = Post()
print("likes are equal: \(like.likes)")
like.like()
print ("now likes are equal : \(like.likes)")


/*:
 ## App Exercise - Workout Functions
 
 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 A `RunningWorkout` struct has been created for you below. Add a method on `RunningWorkout` called `postWorkoutStats` that prints out the details of the run. Then create an instance of `RunningWorkout` and call `postWorkoutStats()`.
 */
struct NewRunningWorkout {
    var distance: Double
    var time: Double
    var elevation: Double
    func postWorkoutStats(){
        print ("The details of the run : 1) distance : \(distance), 2) time : \(time), 3) elevation : \(elevation)")
    }
    
}

var myIndicators = NewRunningWorkout(distance: 10.0, time : 1, elevation : 3)
myIndicators.postWorkoutStats()

/*:
 A `Steps` struct has been created for you below, representing the day's step-tracking data. It has the goal number of steps for the day and the number of steps taken so far. Create a method on `Steps` called `takeStep` that increments the value of `steps` by one. Then create an instance of `Steps` and call `takeStep()`. Print the value of the instance's `steps` property before and after the method call.
 */
struct Steps { 
    var steps: Int = 0
    var goal: Int = 0
    func takeStep (){
       steps + 1
    }
}

var stepByStep = Steps ()
print ("steps are equal \(stepByStep.steps)")
stepByStep.takeStep()
print ("now steps are equal \(stepByStep.steps)")

/*:
 ## Exercise - Computed Properties and Property Observers
 
 The `Rectangle` struct below has two properties, one for width and one for height. Add a computed property that computes the area of the rectangle (i.e. width * height). Create an instance of `Rectangle` and print the `area` property.
 */
struct Rectangle {
    var width: Int
    var height: Int
    var area : Int {
        return width*height
    }
    }
    
var myRectangle = Rectangle(width: 5, height: 5)
print ("area of my rectangle is \(myRectangle.area)")
/*:
 In the `Height` struct below, height is represented in both inches and centimeters. However, if `heightInInches` is changed, `heightInCentimeters` should also adjust to match it. Add a `didSet` to each property that will check if the other property is what it should be, and if not, sets the proper value. If you set the value of the other property even though it already has the right value, you will end up with an infinite loop of each property setting the other.
 
 Create an instance of `Height` and then change one of its properties. Print out the other property to ensure that it was adjusted accordingly.
 */
struct HeightNew {
    var heightInInches: Double {
        didSet {
            if heightInInches != oldValue {
                print ("New values are 1) heightInInches : \(heightInInches) and 2) heightInCentimeters : \(heightInCentimeters)")
            }
                else {
                print ("Values did not change. They are 1) heightInInches : \(heightInInches) and 2) heightInCentimeters\(heightInCentimeters)")
            }
        }
    }
    
    var heightInCentimeters: Double {
        didSet {
            if heightInCentimeters != oldValue {
                print ("New values are 1) heightInInches : \(heightInInches) and 2) heightInCentimeters : \(heightInCentimeters)")
            }
            else {
                print ("Values did not change. They are 1) heightInInches : \(heightInInches) and 2) heightInCentimeters : \(heightInCentimeters)")
            }
        }
    }
    init(heightInInches: Double) {
                self.heightInInches = heightInInches
                self.heightInCentimeters = heightInInches*2.54
            }

    init(heightInCentimeters: Double) {
        
                self.heightInCentimeters = heightInCentimeters
                self.heightInInches = heightInCentimeters/2.54
                
    }
}
    
var myNewVariable = HeightNew(heightInCentimeters: 160)
myNewVariable.heightInCentimeters = 160
myNewVariable.heightInCentimeters = 159

/*:
 ## App Exercise - Mile Times and Congratulations
 
 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 The `RunningWorkout` struct below holds information about your users' running workouts. However, you decide to add information about average mile time. Add a computed property called `averageMileTime` that uses `distance` and `time` to compute the user's average mile time. Assume that `distance` is in meters and 1600 meters is a mile.
 
 Create an instance of `RunningWorkout` and print the `averageMileTime` property. Check that it works properly.
 */
struct RunningWorkoutNEW {
    var distance: Double
    var time: Double
    var elevation: Double
    var averageMileTime : Double {
        return distance/1600/time
    }

}

var newIndicator = RunningWorkoutNEW(distance: 3200, time: 2, elevation : 500)
print ("averageMileTime is \(newIndicator.averageMileTime)")

/*:
 In other app exercises, you've provided encouraging messages to the user based on how many steps they've completed. A great place to check whether or not you should display something to the user is in a property observer.
 
 In the `Steps` struct below, add a `willSet` to the `steps` property that will check if the new value is equal to `goal`, and if it is, prints a congratulatory message. Create an instance of `Steps` where `steps` is 9999 and `goal` is 10000, then call `takeStep()` and see if your message is printed to the console.
 */
struct StepsNew {
    var steps: Int {
      willSet {
            if newValue == goal {
                print ("Congratulations! You have reached the goal \(goal)")
            }
        }
    }
    var goal: Int
        mutating func takeStep() {
        steps += 1
    }
}


var newIndicatorOfSteps = StepsNew(steps : 9999, goal : 10000)
newIndicatorOfSteps.takeStep()

/*:
 ## Exercise - Type Properties and Methods
 
 Imagine you have an app that requires the user to log in. You may have a `User` struct similar to that shown below. However, in addition to keeping track of specific user information, you might want to have a way of knowing who the current logged in user is. Create a `currentUser` type property on the `User` struct below and assign it to a `user` object representing you. Now you can access the current user through the `User` struct. Print out the properties of `currentUser`.
 */
struct UserNext {
    var userName: String
    var email: String
    var age: Int
    static var currentUser = UserNext(userName : "Anastasiia", email : "anastasiyavishnevskaya@gmail.com", age : 30)
    static func logIn(user: UserNext) {
        print ("User \(user.userName) has logged in")
    }
}
let user = UserNext.currentUser
print ("Current User is \(user)")
let message = UserNext.logIn(user : user)


/*:
 There are other properties and actions associated with a `User` struct that might be good candidates for a type property or method. One might be a method for logging in. Go back and create a type method called `logIn(user:)` where `user` is of type `User`. In the body of the method, assign the passed in user to the `currentUser` property, and print out a statement using the user's userName saying that the user has logged in.
 
 Below, call the `logIn(user:)` method and pass in a different `User` instance than what you assigned to currentUser above. Observe the printout in the console.
 */


//I wrote the answer above


/*:
 ## App Exercise - Type Properties and Methods
 
 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 In another exercise, you added a computed property representing the average mile time from a run. However, you may want to have a calculator of sorts that users can use before their run to find out what mile time they need to average in order to run a given distance in a given time. In this case it might be helpful to have a type method on `RunningWorkout` that can be accessed without having an instance of `RunningWorkout`.
 
 Add to `RunningWorkout` a type method `mileTimeFor(distance:time:)` where `distance` and `time` are both of type `Double`. This method should have a return value of type `Double`. The body of the method should calculate the average mile time needed to cover the passed in distance in the passed in time. Assume that distance is in meters and that one mile is 1600 meters.
 
 Call the method from outside of the struct and print the result to ensure that it works properly.
 */
struct RunningWorkoutAnother {
    var distance: Double
    var time: Double
    var elevation: Double
    static func mileTimeFor(_ distance: Double, _ time: Double) -> Double {
        return distance/1600/time
    }
    static var meterInFeet = 3.28084
    static var mileInMeters = 1600.0
}
let mileTime = RunningWorkoutAnother.mileTimeFor(3200, 0.5)
print ("mileTime is \(mileTime)")
print ("meterInFeet: \(RunningWorkoutAnother.meterInFeet)")
print ("mileInMeters: \(RunningWorkoutAnother.mileInMeters)")


/*:
 It may be helpful to have a few type properties on `RunningWorkout` representing unit conversions (i.e. meters to mile, feet to meters, etc.). Go back and add a type property for `meterInFeet` and assign it 3.28084. Then add a type property for `mileInMeters` and assign it 1600.0. Print both of these values below.
 */
//The answer is above

/*:
 
 _Copyright © 2017 Apple Inc._
 
 _Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:_
 
 _The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software._
 
 _THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE._
 */
//: [Previous](@previous)  |  page 10 of 10

