//
//  main.swift
//  0706012110012_Edward Hartantio_AFL1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

var healthPoints: Int = 100
var manaPoints: Int = 50
var potions: Int = 20

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

let fleeT = """
You feel that if you don't escape soon, you won't be able to continue the fight. You look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.
              
You're safe, for now. Press [return] to continue:
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
- Physical Attack. No mana required. Deal 5pt of damage.
- Fire Ball. Use 15pt of MP. Deal 50pt of damage.
- Guardian Shield. Use 10pt of MP. Block enemy's attack in 1 turn.

Items:
- Potion x10. Heal 20pt of your HP.
- Elixir x5. Add 10pt of your MP

Press [return] to go back:
""")
}

func hPotion() {
    print("""
Your HP is \(healthPoints).
Your have \(potions) Potions.

""")
}

func fTroll() {
    var trollH: Int = 1000
    var inputTroll: Int = 0
    while inputTroll != 6{
        print("""
As you enter the forest, you feel a sense of unease wash over you.
Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.

👿Name: Troll x1
👿Health: \(trollH)

Choose your action:
[1] Physical Attack. No mana required. Deal 5pt of damage.
[2] Fire Ball. Use 15pt of MP. Deal 50pt of damage.
[3] Guardian Shield. Use 10pt of MP. Block enemy's attack in 1 turn.

[4] Use Potion to heal wound.
[5] Scan enemy's vital.
[6] Flee from battle.

Your choice?
""")
        
        while true {
            if let inputStr = readLine(), let num = Int(inputStr) {
                if (1...6).contains(num) {
                    inputTroll = num
                    break
                }
            }
            print("Invalid input, please try again.")
        }
        
        switch inputTroll {
        case 1:
            trollH -= 5
            healthPoints -= 10
            print("You punch the Troll using your mighty hand")
            print("")
        case 2:
            trollH -= 50
            healthPoints -= 10
            manaPoints -= 15
            print("Alakazamm... the Troll hitted by your fire ball")
            print("")
        case 3:
            manaPoints -= 10
            print("You block Troll's attack using Guardian Shield")
            print("")
        case 4:
            potions -= 1
            healthPoints += 10
            print("You healing di Bromo")
            print("")
        case 5:
            print("Scanning the enemy using your Samsung S23 Ultra")
        case 6:
            print(fleeT)
            while let inputCon = readLine(){
                if inputCon == ""{
                    break
                } else {
                    print(fleeT)
                }}
            print(journeyS)
        default:
            print("Unexpected input.")
        }
    }
}

func mGolem() {
    print("""
    
    """)
}

while true {
    if let inputJourney = readLine()?.uppercased() {
        switch inputJourney {
        case "C":
            cStat()
            while let inputCon = readLine(){
                if inputCon == ""{
                    break
                } else {
                    cStat()
                }}
            print(journeyS)
        case "H":
            hPotion()
            var optionHeal = false
            
            while !optionHeal {
                print("Are you sure want to use 1 potion to heal wound? [Y/N]")
                if let response = readLine() {
                    if response.uppercased() == "Y" {
                        optionHeal = true
                        potions -= 1
                        let healingPotion = 20
                        if healthPoints + healingPotion > 100 {
                            healthPoints = 100
                        } else {
                            healthPoints += healingPotion
                        }
                        print("Still want to use 1 potion to heal wound again? [Y/N]")
                    } else if response.uppercased() == "N" {
                        optionHeal = true
                        print(journeyS)
                    } else if potions == 0{
                        print("""
                        You don't have any potion left. Be careful of your next journey.
                    Press [return] to go back:
                    """)
                        while let inputCon = readLine(){
                            if inputCon == ""{
                                break
                            } else {
                                cStat()
                            }}
                        print(journeyS)
                    } else {
                        print("Invalid input. Please enter either 'Y' or 'N'.")
                    }
                }
            }
            
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




