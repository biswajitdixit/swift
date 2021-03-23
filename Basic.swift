import Foundation

//Tupels

class Calculator {
    func divideTwoNumber(value1: Int, value2: Int ) -> (quotient: Float, reminder: Int) {

        let divisionResult = Float(value1 / value2)
        let divisionReminder = value1 % value2
        return (divisionResult, divisionReminder) 
     
    }
}

let objCalculate = Calculator()
let result = objCalculate.divideTwoNumber(value1: 10, value2: 6)
print(result)

//Optional

var currentValue:Int? = nil
var x :String? = "Optional variable"
print(currentValue) 
print(x) 

currentValue = 1
x = nil
print(currentValue)
print(x) 

//Unwrapping Optional

var a:Int? = 2
var c:Int? = 3
var b:Int = 4

print(a!) //  2
print(a! + b) // 6
print(a! + c!) // 5
var unwrapThis:String? = "Unwrap me please"
print(unwrapThis) // Optional("Unwrap me please")
print(unwrapThis!)// Unwrap me please

//Error Handaling

enum UserDetailError: Error {
    case noValidName
    case noValidAge
}

func userTest(age: Int, name: String) throws {
    
    guard age > 0 else{
    throw UserDetailError.noValidAge
    }
    
    guard name.count > 0 else{
       throw UserDetailError.noValidName
    }
}

do{
try userTest(age: -1, name: "")
} catch let error {
    print("Error: \(error)")
}


//protocol

protocol Calculation{
    func addition( a:Int, b:Int ) -> Int 
}

class MathOperation:Calculation {
    func addition ( a:Int, b:Int ) ->  Int {
        return a + b
    }
}
var add = MathOperation()

var output = add.addition(a:10 ,b: 20)
print(output)//30      


//closuer

func helloWorldFunc()
{
    print("Hello World")
}
var helloWorldClosure = { () -> () in print("Hello World") }

helloWorldFunc() // Hello World
helloWorldClosure() // Hello World

class Person {

    var x: Int
    var myClosure: ()->() = {print("Hey there")}
    init(x: Int)
    {
    self.x = x
    }
    
    func initClosure()
    {
        myClosure = { print("Initial value is not defined yet")}
    }
    
    deinit{
    print("\(self) escaped")
    }
    

}

var a:Person? = Person(x: 0)
a?.initClosure()
a?.x = 5
a?.myClosure()
a = nil
