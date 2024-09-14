//
//  main.swift
//  assignment2
//
//  Created by Инара Алмагамбетова on 14.09.2024.
//

import Foundation

var fruits: [String] = ["Apple", "Orange", "Banana", "coconut", "mango"]
print(fruits[2])

var favNums: Set<Int> = [7, 8, 11]
favNums.insert(5)
print(favNums)

var programLanguages = ["Python": 1991, "Swift": 2014, "Java": 1996]
let swiftRelease = programLanguages["Swift"]
print("Swift was released in \(swiftRelease!).")

var colours = ["white", "red", "black", "yellow"]
colours[1] = "green"
print(colours)

var set1: Set = [1, 2, 3, 4]
var set2: Set = [3, 4, 5, 6]
var intersectionSet = set1.intersection(set2)
print(intersectionSet)

var studentScores = ["Ayan": 100, "Alina": 81, "Asel": 89]
studentScores["Alina"] = 85
print(studentScores)

var firstArray = ["apple", "banana"]
var secondArray = ["cherry", "date"]
firstArray += secondArray
print(firstArray)

var countriesPopulation = ["Kazakhstan": 19620000, "France": 67970000, "USA": 333300000]
countriesPopulation["China"] = 1412000000
print(countriesPopulation)

var firstSet: Set = ["cat", "dog"]
var secondSet: Set = ["dog", "mouse"]
var result = firstSet.union(secondSet).subtracting(secondSet)
// result = result.subtracting(secondSet)
print(result)

var studentsGrades = ["Ayan": [100, 95, 97], "Alina": [81, 87, 91], "Asel": [89, 94, 91]]
var AyanSecondGrade = studentsGrades["Ayan"]![1]
print("Ayan's second grade is \(AyanSecondGrade)")

