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

//---------------------------------------------------------------------------------------------
//Structs and enum

struct Car {
    
    var brandName: String
    var modelName: String
    var carType: CarType
    
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
}

enum CarType {
    case sport
    case sedan
    case hatchBack
    case jeep
}

var car = Car(brandName: "Audi", modelName: "A3", carType: .sedan)
