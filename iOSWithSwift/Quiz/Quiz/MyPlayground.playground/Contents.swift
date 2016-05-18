//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var winningLotteryNumbers : Set<Int>

winningLotteryNumbers = [1,2,2,3]
print(winningLotteryNumbers)

var countingUp = ["one", "two"]
countingUp.append("three")

var reading1 :Float?
var reading2 :Float?
var reading3 :Float?

reading1 = 9.8
reading2 = 9.2
reading3 = 9.7

//let aveReading = (reading1! + reading2! + reading3!) / 3

if let r1 = reading1, r2 = reading2, r3 = reading3 {
    let aveReading = (r1 + r2 + r3) / 3
} else {
    let errorString = "Instrument reported a reading that was nil"
}

let nameByParkingSpace = [13 : "Alcie", 27 : "Bob"]

let name13 : String? = nameByParkingSpace[13]

if let n13 = nameByParkingSpace[13] {
    print(n13)
}

let name43 : String? = nameByParkingSpace[43]

for (i, string) in countingUp.enumerate() {
    let name = "\(i), \(string)"
}

enum PieType {
    case Apple
    case Cherry
    case Pecan
}

let favouritePie = PieType.Apple

let name: String

switch favouritePie {
case .Apple:
    name = "Apple"
case .Cherry:
    name = "Cherry"
case .Pecan:
    name = "Pecan"
}

enum PieType1 : Int {
    case Apple = 1
    case Cherry
    case Pecan
}

let pieRawValue = PieType1.Pecan.rawValue

if let pieType = PieType1(rawType: pieRawValue) {
    
}



