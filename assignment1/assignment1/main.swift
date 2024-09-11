//
//  main.swift
//  assignment1
//
//  Created by Инара Алмагамбетова on 11.09.2024.
//

import Foundation

//print("Hello, World!")a

var firstName: String = "Inara"
var lastName: String = "Almagambetova"
// var age: Int = 21
var birthYear: Int = 2003
let isStudent: Bool = true
let height: Double = 1.71
let city: String = "Almaty"
let email: String = "almagambetovai@mail.ru"
let phoneNumber: String = "87776378811"

let currentYear: Int = 2024
var age = currentYear - birthYear
// print(age)

var hobby = "reading \u{1F4DA}"
var numberOfHobbies = 2
var favoriteNumber = 8
var isHobbyCreative = false
var otherHobbies = "photogtaphy \u{1F4F7}"
var university = "KBTU"
var faculty = "SITE"

var futureGoals = "In the future, I want to become a professional project manager."

let summary = """
My name is \(firstName) \(lastName). I am \(age) years old, born in \(birthYear).
I am currently \(isStudent ? "a student" : "not a student").
I study at \(university) on the faculty \(faculty).
I enjoy \(hobby), which is \(isHobbyCreative ? "a creative hobby" : "not a creative hobby").
I have \(numberOfHobbies) hobbies in total, including \(otherHobbies). My favorite number is \(favoriteNumber).
\(futureGoals)
"""

print(summary)

