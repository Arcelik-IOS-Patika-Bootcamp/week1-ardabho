import UIKit

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
