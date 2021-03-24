import Foundation
class FileOperation {
    
    func readDataFromFile(fileName:String, fileExtension: String) -> [Employee] {
        let fileURLProject = Bundle.main.path(forResource: fileName, ofType: fileExtension)
        var readStringHello = ""
        
        do {
            readStringHello = try String(contentsOfFile: fileURLProject!, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        let line = readStringHello.split(separator: "\n")
        var employees = [Employee]()
        for elements in line {
            let elements = elements.split(separator: ",")
            let firstName = String(elements[0])
            let lastName = String(elements[1])
            let age = Int(elements[2])!
            let company = String(elements[3])
            let salary = Int(elements[4])!
            let employee = Employee(firstName: firstName, lastName: lastName, age: age, company: company, salary: salary)
            employees.append(employee)
        }
        return employees
    }
    
}



class Employee {
    var firstName: String
    var lastName: String
    var age: Int
    var company:String
    var salary:Int
    
    init(firstName: String, lastName: String, age: Int, company:String, salary: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.company = company
	}
}
