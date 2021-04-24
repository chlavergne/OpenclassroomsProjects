//
//  Player.swift
//  gamerpg
//
//  Created by Christophe Expleo on 26/03/2021.
//

import Foundation

class Team {
    var team = [Character]() // Stores the 3 selected characters
    var numbers = [Int]() // Stores the character number choice
    var playerNumber = String() // Stores the player number (used only in texts)
    var name = String() // Team name

    init(playerNumber: String) {
        self.playerNumber = playerNumber
    }

    func availableCharacter() { // 6 possible choice. The same type of character can be selected multiple time.
        for index in 0...2 {
            print("\n  Please choose a number between 1 and 6 to select the character N° \(index + 1) of your team:  " )
            numbers.append(askForNumber())
            switch numbers[index] {
            case 1:
                team.append(Ninja())
                team[index].name = askForName()
                Character.names.append(team[index].name)
            case 2:
                team.append(Magician())
                team[index].name = askForName()
                Character.names.append(team[index].name)
            case 3:
                team.append(Clown())
                team[index].name = askForName()
                Character.names.append(team[index].name)
            case 4:
                team.append(SuperHero())
                team[index].name = askForName()
                Character.names.append(team[index].name)
            case 5:
                team.append(Santa())
                team[index].name = askForName()
                Character.names.append(team[index].name)
            case 6:
                team.append(Elf())
                team[index].name = askForName()
                Character.names.append(team[index].name)
            default:
                print("New character coming soon?")
            }
            print("\n \(team[index].logo) \(team[index].name) the \(team[index].type) be part of your team now 👍 \n")
        }
    }

    func selectCharacter() { // Selection of characters for the constitution of teams.
        print("""


                     ---------------------------------------------------------------------
                     | 1 |-🥷🏻 Ninja      | Weapon: 🗡 | Life= 10 | Damage = 4 | Heal = 4 |
                     ---------------------------------------------------------------------
                     | 2 |-🧙‍♂️ Magician   | Weapon: 🪄 | Life= 8  | Damage = 6 | Heal = 4 |
                     ---------------------------------------------------------------------
                     | 3 |-🤡 Clown      | Weapon: 🥊 | Life= 6  | Damage = 7 | Heal = 5 |
                     ---------------------------------------------------------------------
                     | 4 |-🦸🏻‍♀️ Super-Hero | Weapon: 🤳 | Life= 12 | Damage = 3 | Heal = 3 |
                     ---------------------------------------------------------------------
                     | 5 |-🎅🏻 Santa      | Weapon: 🦺 | Life= 6  | Damage = 6 | Heal = 6 |
                     ---------------------------------------------------------------------
                     | 6 |-🧝‍♀️ Elf        | Weapon: 🍌 | Life= 5  | Damage = 5 | Heal = 8 |
                     ---------------------------------------------------------------------
                     """)
        availableCharacter()
        print("""
                     The team \(name) is complete, here is its composition:
                    """)
        teamBoard()
    }

    func renameTeam() { // Gives a name to the team
        print("\nHello \(playerNumber), what name would you like to give to your team? \n")
        name = Selector.betterReadLine()
        if name == "" {
            print("You must choose at least one letter")
            return renameTeam()
        }
        guard name != " " else {
            print("You need to use some letters!")
            return renameTeam()
        }
        print("\nGreat! we will now add 3 characters to the team \(name):\n")
    }

    func controlTeamName(passivePlayer: Team) { // Check if the team name has not already been chosen by player 1
        renameTeam()
        guard name != passivePlayer.name else {
            print("This name has already been chosen by the player 1\n")
            controlTeamName(passivePlayer: passivePlayer)
            return
        }
    }

    func teamBoard() { // Displays the team of each player.
        for index in 0...2 {
            let teamMember = "\(index + 1) | -\(team[index].logo)  \(team[index].name) the \(team[index].type)"
            let stat = "Life = \(team[index].life) | Damage = \(team[index].weapon.damage) | Heal = \(team[index].heal)"
            let weaponLogo = "weapon \(team[index].weapon.logo)"
            print("""
                    -----------------------------------------------------------------------------------------------
                    | \(teamMember)                 | \(weaponLogo) | \(stat)
                    -----------------------------------------------------------------------------------------------
                    """)
        }
    }

    func askForFighter() -> Character {
        let number = Selector.betterReadLine()
        guard let myRealNumber = Int(number)  else {
            print("\nThis is not a number")
            return askForFighter()
        }
        guard (1...3).contains(myRealNumber) else {
            print("\nThis is not a number between 1 and 3")
            return askForFighter()
        }
        return team[myRealNumber - 1]
    }

    func hasAliveFighters() -> Bool {
        return (team[0].isDead() && team[1].isDead() && team[2].isDead()) == false
    }

    private func askForName() -> String { // Check that the Character name is not already in use
        print("Please choose a name for your character: ")
        let nameChoosed = Selector.betterReadLine()
        if Character.names.contains(nameChoosed) {
            print("This name is already in use for another character, please choose a different one: ")
            return askForName()
        }
        if nameChoosed == "" {
            print("You must choose at least one letter")
            return askForName()
        }
        guard nameChoosed != " " else {
            print("You need to use some letters!")
            return askForName()
        }
        return nameChoosed
    }

    private func askForNumber() -> Int {
        let number = Selector.betterReadLine()
        guard let myRealNumber = Int(number)  else {
            print("\nThis is not a number")
            return askForNumber()
        }
        guard (1...6).contains(myRealNumber) else {
            print("\nThis is not a number between 1 and 6")
            return askForNumber()
        }
        return myRealNumber
    }
}
