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
    print("Product: \(key)     Value: \(value)")
}

//filter expensive products and assign them to a different dictionary
let expensiveProducts = prices.filter { (key, value) in
    return value >= 5000
}

print("--------------------------------------------------------------------------------------------------------------------")
//---------------------------------------------------------------------------------------------
//Structs and enum

struct Car {
    
    var brandName: String
    var modelName: String
    var carType: CarType
    private var passengerCount: Int
    
    init(brandName: String, modelName: String , carType: CarType) {
        self.brandName = brandName
        self.modelName = modelName
        self.carType = carType
        passengerCount = 0
    }
    
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
    mutating func setPassengerCount(noOfPassengers: Int) {
        
        guard noOfPassengers <= seatCount else {
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
    
}

//Enum for the cars type
enum CarType {
    case sport
    case sedan
    case hatchBack
    case jeep
}

var car = Car(brandName: "Audi", modelName: "A3", carType: .hatchBack)
car.setPassengerCount(noOfPassengers: 5)
car.getPassengerCount()
