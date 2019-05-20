//: [Previous](@previous)
/*:
 ## Protocols
 Protocols are a defined contract or blueprint that a class, struct or enum must follow.
 */
/*:
 Here we define a 'ShapeProtocol' where anything that conforms to it must provide a property of number of sides and a function called 'shapeDescription'
 */
protocol ShapeProtocol {
    var numberOfSides: Int { get set }
    func shapeDescription()
    func calculateArea()
  var color: String{get set}
  init(colour:String)
}

/*:
 This 'Square' class conforms to the 'ShapeProtocol' and defines the number of sides for this shape and it has the shapeDescription method inside.
 */
class Square: ShapeProtocol {
    var numberOfSides: Int
  var color: String
    
    init(){
        self.numberOfSides = 4
      self.color = "red"
    }
    
    func shapeDescription() {
        
        print("This is a square")
    }
  
  func calculateArea() {
    print("area")
  }
  
  required init(colour: String) {
    self.color = colour
    self.numberOfSides = 3
  }
}

/*:
 - Experiment:
 Add a new function in our 'ShapeProtocol' that should calculate the area of its shape. Make sure you implement it in our 'Square' class as well.
 */

/*:
 - Experiment:
 Add a new property in our 'ShapeProtocol' of type String that indicates the colour of this shape.
 */

/*:
 - Experiment:
 We can also declare a custom initializer within our 'ShapeProtocol' that any class must have present. Create an initializer that takes in a colour as a parameter.
 */

/*:
 - Callout(Challenge):
 Define a person protocol with name, gender, age and add a custom initializer to set all the properties and a function to print a description of this person. Create a 'Student' class that conforms to this protocol and print the description of this student using its name.
 */
protocol Person{
  var name:String{get set}
  var age:Int{get set}
  var gender:String{get set}
  
  init(name:String, age:Int, gender:String)
  
  func description()
  
}

class Student:Person{
  var name:String
  var age:Int
  var gender:String
  
  required init(name: String, age: Int, gender: String) {
    self.name = name
    self.age = age
    self.gender = gender
  }
  
  func description() {
    print("\(name), \(age), \(gender)")
  }
}
/*:
 ## Extensions
 Extensions are a way to add additional functions to an existing class, struct or enum.
 \
 For example, I can extend the `'Double'` class to add a function I may use very often such as squaring a number. ie: 4*4 = 16
 
 - Note:
 Extensions are like categories from Objective-C. Unlike Objective-C categories, Swift extensions do not have names.
 */

// This is declaring an extension on the Double class
extension Double {
    
    // This 'square' function takes its own value and multiples it by itself, then returns the new value
    func square() -> Double {
        
        return self * self
    }
}

var myDoubleValue = 5.0
var mySquaredDoubleValue = myDoubleValue.square()

/*:
 - Experiment:
 Try adding the 'square' function to the `Float` type
 */
extension Float{
  func square() -> Float{
    return self * self
  }
}

var afloat = 5.0
afloat.square()
/*:
 We are going to add a few extensions to several classes that you could potentially use for your future projects to make things more convenient.
 */
/*:
 - Callout(Challenge):
 Create an extension on UIColor that converts hex represented colours to a UIColor to use. ex: #FFFFFF would give a UIColor of white (Hint: You can google the algorithm on how to convert hex values to a UIColor)
 */
import UIKit
extension UIColor{
  
  func intFromHexString(hexStr: String) -> UInt32 {
    var hexInt: UInt32 = 0
    // Create scanner
    let scanner: Scanner = Scanner(string: hexStr)
    // Tell scanner to skip the # character
    scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
    // Scan hex value
    scanner.scanHexInt32(&hexInt)
    return hexInt
  }
  
  func colorWithHexString(hexString: String, alpha:CGFloat = 1.0) -> UIColor {
    
    // Convert hex string to an integer
    let hexint = Int(self.intFromHexString(hexStr: hexString))
    let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
    let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
    let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
    
    // Create color object, specifying alpha as well
    let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
    return color
  }
}
/*:
 - Callout(Challenge):
 Create an extension on `String` called 'trim'. This will return a `String` that has the whitespace trimmed from the beginning and end. For example: "    hello there  " will return "hellothere"
 */
extension String{
  func trim() -> String{
    return String(self.dropFirst())
  }
}
/*:
 - Callout(Challenge):
 Create an extension on String that checks if an email address has a valid format. You can make the rules as strict or as loose as you'd like. Rules can include verifying there are no spaces, there is a '@' present, etc.
 */
extension String{
  func checkFormat()->Bool{
    if !self.contains(" ") && self.contains("@"){
      return true
    }else {
      return false
    }
}
/*:
 - Callout(Challenge):
 Create an extension on `Double` to add a function that converts the number of seconds into minutes and another function to hours. ex: Given 900 seconds, the minutes returned will be 15 minutes, and the hours returned would be 0.25 hours.
 */
  extension Double{
    func convertMinutes() -> Double{
      return self / 60
    }
    func convertHours() -> Double{
      return self / 3600
    }
}
//: [Next](@next)
