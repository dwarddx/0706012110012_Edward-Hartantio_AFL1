//
//  main.swift
//  0706012110012_Edward Hartantio_AFL1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

var healthPoints: Int = 100
var manaPoints: Int = 50

let openingS = """
Welcome to the world of magic! 🧙🏻🧌

You have been chosen to embark on an epic journey as a young wizard on the path to becoming a master of the arcane arts. Your adventures will take you through forests 🌲, mountains⛰️, and dungeons🏰, where you will face challenges, make allies, and fight enemies.

Press [return] to continue :
"""

let welcomingS = """
May I know your name, a young wizard?
"""

let journeyS = """
From here, you can...

[C]heck your health and stats
[H]eal your wounds with potion

...or choose where you want to go

[F]orest of Troll
[M]ountain of Golem
[Q]uit game

Your choice?
"""

func getInput() -> String {
    // Keep asking for input until a valid alphabetic string is entered
    while true {
        if let input = readLine(), input.count > 0 {
            // Check if input contains only alphabetic characters
            let isValidInput = input.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil
            if isValidInput {
                return input
            }
        }
        print("Invalid input. Please enter only alphabetic characters.")
    }
}

print(openingS)

while let inputCon = readLine(){
    if inputCon == ""{
        break
    } else {
        print("")
        print(openingS)
    }}

print(welcomingS)
let nickname = getInput()
print("")
print("Nice to meet you \(nickname)!")

print(journeyS)

//JOURNEY OPTION
func cStat() {
    print("""
Player name: \(nickname)

HP: \(healthPoints)/100
MP: \(manaPoints)/50

Magic:
- Physical Attack.
""")
}

func hPotion() {
    
}

func fTroll() {
    
}

func mGolem() {
    
}

while true {
    if let inputJourney = readLine()?.uppercased() {
        switch inputJourney {
        case "C":
            cStat()
        case "H":
            hPotion()
        case "F":
            fTroll()
        case "M":
            mGolem()
        case "Q":
            print("Thank you for playing...")
            exit(0)
        default:
            print("Invalid input")
        }
    } else {
        print("Error reading input.")
        exit(1)
    }
}




