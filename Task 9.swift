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



