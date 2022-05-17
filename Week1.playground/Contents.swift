import Foundation

// Array and optionals practice

var watchBrands: [String]?
var brandString: String = ""

watchBrands = ["Apple", "Seiko", "Wainer", "Patek Philippe", "Casio", "Samsung"]

if let safeBrands = watchBrands {
    
    for brand in safeBrands {
        brandString = brandString + brand + ", "
    }
    print("Current brands are: \(brandString)")
    
} else {
    print("Error: brands array is nil")
}

print("--------------------------------------------------------------------------------------------------------------------")
//----------------------------------------------------------------------------------------------
// Set Practice

//Adding the same items to an array before turning it into a set
var guitarBrands = ["Gibson", "Fender", "Cort", "Takamine", "Taylor"]
var sameGuitarBrands = guitarBrands

guitarBrands.append(contentsOf: sameGuitarBrands)

print("GuitarBrands array before turning it into a Set: \(guitarBrands)")

var guitarBrandsSet = Set(guitarBrands)
print("GuitarBrands array after turning it into a Set: \(guitarBrandsSet)")

//Removing some items from the set
guitarBrandsSet.remove("Gibson")
guitarBrandsSet.remove("Taylor")

guitarBrandsSet

print("--------------------------------------------------------------------------------------------------------------------")
//---------------------------------------------------------------------------------------------
//Dictionary practice

var prices: [String : Float] = [:]
prices = [
    "Iphone 13" : 24000,
    "S22 Ultra" : 29000,
    "Pringles"  : 24,
    "Butter"    : 25,
    "Book"      : 60
]

//add new item
prices["Airpods Pro"] = 4000

//remove the butter
prices.removeValue(forKey: "Butter")

prices.forEach { (key,value) in
    print("Product: \(key)     Price: \(value)")
}

//filter expensive products and assign them to a different dictionary
let expensiveProducts = prices.filter { (key, value) in
    return value >= 5000
}

print("--------------------------------------------------------------------------------------------------------------------")
//---------------------------------------------------------------------------------------------
//Structs and enum

struct Car {
    
    let brandName: String
    let modelName: String
    let carType: CarType //The type of car. Sedan, Sport etc. See the CarType enum
    private var passengerCount: Int
    private var engineStatus: Bool // True if the engine is running
    
    init(brandName: String, modelName: String , carType: CarType) {
        self.brandName = brandName
        self.modelName = modelName
        self.carType = carType
        passengerCount = 0
        engineStatus = false
    }
    
    //Number of seats set according to cars type.
    private var seatCount: Int {
        get {
            switch carType {
            case .sport:
                return 2
            case .sedan:
                return 4
            case .hatchBack:
                return 4
            case .jeep:
                return 6
            }
        }
    }
    
    /// Sets the passenger count of the car. Returns nothing
    /// - Parameter noOfPassengers: Number of current passengers in the car
    mutating func setPassengerCount(count noOfPassengers: Int) {
        
        guard (noOfPassengers <= seatCount) && (noOfPassengers > 0) else {
            print("The number of passengers cannot exceed the number of seats in the car!")
            return
        }
        passengerCount = noOfPassengers
    }
    
    /// Get the number of passengers in the car
    /// - Returns: Number of passengers in the car
    func getPassengerCount() -> Int {
        return passengerCount
    }
    
    ///Start the engine
    mutating func startTheCar() {
        if passengerCount != 0 {
            print("Engine started")
            engineStatus = true
        } else {
            print("There is no people in the car to start it")
        }
    }
    
    ///Stop the engine
    mutating func stopTheCar() {
        if passengerCount != 0 {
            print("Engine stopped")
            engineStatus = false
        } else {
            print("There is no people in the car to start it")
        }
    }
    
    /// Pick up some passengers
    /// - Parameter passengersForPickUp: Number of passengers to pick up
    mutating func pickUpPassenger(count passengersForPickUp: Int) {
        let newPassengerNumber = passengerCount + passengersForPickUp
        if newPassengerNumber > seatCount {
            print("The number of passengers cannot exceed the number of seats in the car!")
        } else {
            passengerCount = newPassengerNumber
        }
    }
    
    /// Drop some passengers
    /// - Parameter passengersToDrop: Number of passengers to drop off
    mutating func dropPassengers(count passengersToDrop: Int) {
        let newPassengerNumber = passengerCount - passengersToDrop
        if newPassengerNumber < 0 {
            print("Number of people in car can't be negative!")
        } else {
            passengerCount = newPassengerNumber
        }
    }
    
    func drive() {
        if passengerCount > 0  && engineStatus {
            print("Driving...")
        }
        else if passengerCount <= 0  && engineStatus{
            print("There must be a driver in the car to drive")
        } else if passengerCount >= 0  && !engineStatus {
            print("You have to start the engine first")
        }
    }

}

//Enum for the cars type
enum CarType {
    case sport
    case sedan
    case hatchBack
    case jeep
}

var sedanCar = Car(brandName: "Audi", modelName: "A3", carType: .hatchBack)
var sportsCar = Car(brandName: "Mercedes", modelName: "Amg Gt", carType: .sport)
sportsCar.setPassengerCount(count: 2)
sportsCar.startTheCar()
sportsCar.drive()
sportsCar.dropPassengers(count: 1)
sportsCar.stopTheCar()

//---------------------------------------------------------------------------------------------
//Classes

class Computer {
    
}

class Desktop: Computer {
    
}

class Laptop: Computer {
    
}

class SmartPhone: Computer {
    
}

