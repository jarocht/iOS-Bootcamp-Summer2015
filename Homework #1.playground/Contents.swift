//Homework #1 (Lab01)
//Tim Jaroch & Remo Hoeppli

import UIKit

// Problem #1
let myString = "hello"
var cost = 3.14
let cnt: Int = 2
var shouldWe: Bool = true
let intValue = UInt8(strtoul("11", nil, 16))
let binaryIntValue = String(10, radix: 2).toInt()

//Problem #2
var language = "Swift"
var currentVersion = 1.2
var output = "Hello World! I'm learning " + language + " version: \(currentVersion)"

//Problem #3
var arr: [String] = ["queen","worker","drone"]
print(arr[0])
arr.append("honey")
arr += ["are","us"]

//Problem #4
for entry in arr {
    println(entry)
}

for (index, value) in enumerate(arr){
    println("Item# \(index): \(value)")
}

//Problem #5
var dict: Dictionary<String,Double> = ["Mark Twain":8.9,"Nathanel Hawthorne":5.1,"John Steinbeck":2.3,"C.S. Lewis":9.9,"Jon Krakaur":6.1]

//Problem #6
println(dict["John Steinbeck"])
dict["Erik Larson"] = 9.2

if (dict["Jon Krakaur"] > dict["Mark Twain"]) {
    println(dict["Jon Krakaur"])
} else {
    println(dict["Mark Twain"])
}

//Problem #7
for (key, value) in dict {
    println("\(key):\(value)")
}

//Problem #8
for index in 1...10{
    println(index)
}

//Problem #9
for var index = 10; index > 0; --index {
    println(index)
}

//Problem #10
let x = 5, y = 4
var answer = 0
for _ in 1...y {
    answer += x
}
println("\(x) times \(y) is \(answer)")

//Problem #11
var sum: Double = 0.0;
for (key, value) in dict {
    sum += value
}
let avg = sum / Double(dict.count)
println("Dictionary Average Value is \(avg)")

//Problem #12
if (avg < 5.0) {
    println("Low")
} else if (avg < 7.0) {
    println("Moderate")
} else {
    println("High")
}


//Problem #13
var count = arc4random_uniform(1000000)

switch count {
case 0:
    println("none")
case 1...3:
    println("a few")
case 4...9:
    println("several")
case 10...99:
    println("tens of")
case 100...999:
    println("hundreds of")
case 1000...999999:
    println("thousands of")
default :
    println("millions of")
}

//Problem #14
func verbalizeNumber(input: Int) -> String {
    var result = ""
    switch input {
    case 0:
        result = "none"
    case 1...3:
        result = "a few"
    case 4...9:
        result = "several"
    case 10...99:
        result = "tens of"
    case 100...999:
        result = "hundreds of"
    case 1000...999999:
        result = "thousands of"
    default :
        result = "millions of"
    }
    
    return result
}
verbalizeNumber(100)

//Problem #15
for var index = 1; index <= 100000000; index *= 10 {
    println("There are: \(verbalizeNumber(index)) numbers")
}

//Problem #16
func verbalizeAndShoutNumber(input: Int) -> String {
    return verbalizeNumber(input).uppercaseString
}
verbalizeAndShoutNumber(100)

//Problem #17
func expressNumbersElegantly(value: Int, verbalizerFunction: (Int) -> String) -> String {
    var result = 0
    for var index = 1; index <= value; index *= 10 {
        result = index
    }
    
    return verbalizerFunction(result)
}

expressNumbersElegantly(99999999, verbalizeNumber)
expressNumbersElegantly(99999999, verbalizeAndShoutNumber)

//Problem #18
func expressNumbersVeryElegantly(InputValue input: Int, VerbalizerFunction vf: (Int) -> String) -> String {
    
    var result = 0
    for var index = 1; index <= input; index *= 10 {
        result = index
    }
    
    return vf(result)
}

expressNumbersVeryElegantly(InputValue: 99999999, VerbalizerFunction: verbalizeNumber)

expressNumbersVeryElegantly(InputValue: 99999999, VerbalizerFunction:verbalizeAndShoutNumber)

//Problem #19
var famousLastWords = ["the cow jumped over the moon.", "three score and four years ago", "lets nuc 'em Joe!", "ah, there is just something about Swift"]

func capFirstChar(input:String) -> String{
    return prefix(input, 1).capitalizedString + suffix(input, Swift.count(input) - 1)
}
capFirstChar("sushi")

famousLastWords.map(capFirstChar)

//Problem #20
//Project Euler #1
//If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
//Find the sum of all the multiples of 3 or 5 below 1000.

func sumOfMultiples() -> Int {
    var results: [Int] = []
    for var index = 1; index < 1000; index++ {
        if index % 5 == 0 || index % 3 == 0{
            results.append(index)
        }
    }
    
    var sum = 0
    for result in results {
        sum += result
    }
    
    return sum
}

sumOfMultiples()

