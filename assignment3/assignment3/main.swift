//
//  main.swift
//  assignment3
//
//  Created by Инара Алмагамбетова on 25.09.2024.
//

import Foundation

//1
for number in 1...100 {
    if number % 3 == 0 && number % 5 == 0 {
        print("FizzBuzz")
    } else if number % 3 == 0 {
        print("Fizz")
    } else if number % 5 == 0 {
        print("Buzz")
    } else {
        print(number)
    }
}

//2
func isPrime(_ number: Int) -> Bool {
    if number < 2 { return false }
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}

for number in 1...100 {
    if isPrime(number) {
        print(number)
    }
}

//3
func celsiusToFahrenheit(_ celsius: Double) -> Double {
    return (celsius * 9/5) + 32
}

func celsiusToKelvin(_ celsius: Double) -> Double {
    return celsius + 273.15
}

func fahrenheitToCelsius(_ fahrenheit: Double) -> Double {
    return (fahrenheit - 32) * 5/9
}

func kelvinToCelsius(_ kelvin: Double) -> Double {
    return kelvin - 273.15
}

print("Enter value:")
if let input = readLine(), let temp = Double(input) {
    print("Enter unit of temperature:")
    if let unit = readLine() {
        switch unit.uppercased() {
        case "C":
            print("Fahrenheit: \(celsiusToFahrenheit(temp))")
            print("Kelvin: \(celsiusToKelvin(temp))")
        case "F":
            let celsius = fahrenheitToCelsius(temp)
            print("Celsius: \(celsius)")
            print("Kelvin: \(celsiusToKelvin(celsius))")
        case "K":
            let celsius = kelvinToCelsius(temp)
            print("Celsius: \(celsius)")
            print("Fahrenheit: \(celsiusToFahrenheit(celsius))")
        default:
            print("Invalid unit")
        }
    }
}

//4
var shoppingList = [String]()

func displayMenu() {
    print("1. Add item")
    print("2. Remove item")
    print("3. View list")
    print("4. Exit")
}

func addItem() {
    print("Enter item to add:")
    if let item = readLine() {
        shoppingList.append(item)
    }
}

func removeItem() {
    print("Enter item to remove:")
    if let item = readLine(), let index = shoppingList.firstIndex(of: item) {
        shoppingList.remove(at: index)
    } else {
        print("Item not found")
    }
}

func viewList() {
    print("Shopping List: \(shoppingList)")
}

while true {
    displayMenu()
    if let choice = readLine(), let option = Int(choice) {
        switch option {
        case 1:
            addItem()
        case 2:
            removeItem()
        case 3:
            viewList()
        case 4:
            break
        default:
            print("Invalid option")
        }
    }
}


//5
print("Enter a sentence:")
if let sentence = readLine() {
    let words = sentence.lowercased().components(separatedBy: CharacterSet.punctuationCharacters.union(.whitespacesAndNewlines))
    var frequency: [String: Int] = [:]

    for word in words where !word.isEmpty {
        frequency[word, default: 0] += 1
    }

    for (word, count) in frequency {
        print("\(word): \(count)")
    }
}

//6
func fibonacci(_ n: Int) -> [Int] {
    if n <= 0 {
        return []
    }
    var sequence = [0, 1]
    for i in 2..<n {
        sequence.append(sequence[i-1] + sequence[i-2])
    }
    return sequence
}

print(fibonacci(6))

//7
var studentScores: [String: Int] = ["Ayan": 100, "Alina": 83, "Alis": 91]

func calculateAverage(scores: [String: Int]) -> Double {
    let total = scores.values.reduce(0, +)
    return Double(total) / Double(scores.count)
}

let average = calculateAverage(scores: studentScores)
print("Average score: \(average)")

if let highestScore = studentScores.values.max(), let lowestScore = studentScores.values.min() {
    print("Highest score: \(highestScore)")
    print("Lowest score: \(lowestScore)")
}

for (student, score) in studentScores {
    if score >= Int(average) {
        print("\(student) is above the average.")
    } else {
        print("\(student) is below the average.")
    }
}

//8
func isPalindrome(_ text: String) -> Bool {
    let cleanedText = text.lowercased().replacingOccurrences(of: "[^a-zA-Z0-9]", with: "", options: .regularExpression)
    return cleanedText == String(cleanedText.reversed())
}
//
print(isPalindrome("Abc"))
print(isPalindrome("aaa"))


//9
func add(_ a: Double, _ b: Double) -> Double { return a + b }
func subtract(_ a: Double, _ b: Double) -> Double { return a - b }
func multiply(_ a: Double, _ b: Double) -> Double { return a * b }
func divide(_ a: Double, _ b: Double) -> Double? { return b != 0 ? a / b : nil }

while true {
    print("Enter first number:")
    guard let firstInput = readLine(), let firstNum = Double(firstInput) else { continue }

    print("Enter second number:")
    guard let secondInput = readLine(), let secondNum = Double(secondInput) else { continue }

    print("Choose operation (+, -, *, /):")
    if let operation = readLine() {
        let result: Double?

        switch operation {
        case "+":
            result = add(firstNum, secondNum)
        case "-":
            result = subtract(firstNum, secondNum)
        case "*":
            result = multiply(firstNum, secondNum)
        case "/":
            result = divide(firstNum, secondNum)
        default:
            print("Invalid operation")
            continue
        }

        if let result = result {
            print("Result: \(result)")
        } else {
            print("Cannot divide by zero")
        }

        print("Do you want to exit? (yes to exit)")
        if let exitOption = readLine(), exitOption.lowercased() == "yes" {
            break
        }
    }
}


//10
func hasUniqueCharacters(_ text: String) -> Bool {
    var charSet: Set<Character> = []
    for char in text {
        if charSet.contains(char) {
            return false
        }
        charSet.insert(char)
    }
    return true
}

print(hasUniqueCharacters("abcde"))
print(hasUniqueCharacters("aab"))

