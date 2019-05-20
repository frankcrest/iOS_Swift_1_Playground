//: [Previous](@previous)
/*:
 ## Stretch Goals
 - Callout(Stretch Goal 1):
 Earlier we learned about extensions to extend functionality of an existing class, struct or enum. We can take this a step further and we can have our extensions also conform to a protocol.
 \
In our earlier example, we added the 'square' function using our extension. Let's create a new protocol with the 'square' function. Then we can create an extension on any of the numbered types (`Int`, `Double`, `Float`, etc.) and have it conform to our new protocol
 \
Implement the 'square' function and test it out!
*/
protocol square{
  func square() -> Double
}

extension Double:square{
  func square() -> Double{
    return self * self
  }
}
/*:
 - Callout(Stretch Goal 2):
 Enums can have associated values with them to add extra information. For example, we can represent the different states of a consumer going through a purchasing transaction.
 \
Purchase States:
 - Checkout state with number of items
 - Purchasing state with type of payment (cash, credit, debit) and the total cost
 - Puchased state with a success or failure result
 
 
 Create the enums for these states and create a switch statement to handle each enum and print their associated values.
 */
enum PurchaseState{
  case checkOut(Int)
  case purchasing(String, Int)
  case success(Bool)
}

var newCustomer = PurchaseState.checkOut(5)

switch newCustomer {
case .checkOut(let number) :
  print("\(number)")
default:
  print("hello")
}
/*:
 - Callout(Stretch Goal 3):
 Write a class to solve the following problem.
 */
//:
//: ### Problem: “How do we calculate a student’s grade for the term?”
//:
//: Each term has a midterm exam, a final exam, and a paper to write.
//: Each piece has a weighted percentage
//: All exams and papers are scored out of 100
//:
//: Exam weight is 30%, paper weight is 40%
//:
//: Formula to calculate student's grade:
//: (midtermExam * examWeight) + (finalExam * examWeight) + (paperScore * paperWeight)
//:
//: Grade Scale:
//: A > 80, B > 70, C > 60, D > 50, F < 50
//:
//: Requirements:
//: We need to convert the student’s grade to an overall grade and letter grade for the term
class Term{
  var midTermMark : Double
  var finalExamMark : Double
  var paperMark : Double
  
  func calculateGrade() -> (Double,String){
    let mark = self.midTermMark * 0.3 + self.finalExamMark * 0.3 + self.paperMark * 0.4
    var grade = ""
    switch mark {
    case 0...50:
      grade = "F"
    case 50...60:
      grade = "D"
    case 60...70:
      grade = "C"
    case 70...80:
      grade = "B"
    case 80...100:
      grade = "A"
    default:
      grade = "G"
    }
    return (mark, grade)
  }
  
  init(mid:Double, final:Double, paper:Double) {
    self.midTermMark = mid
    self.finalExamMark = final
    self.paperMark = paper
  }
}

let newTerm = Term(mid: 90, final: 90, paper: 90)
newTerm.calculateGrade()
