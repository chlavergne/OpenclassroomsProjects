//
//  Game.swift
//  gamerpg
//
//  Created by Christophe Expleo on 26/03/2021.
//

import Foundation

final class Game {
    var playerOne = Team(playerNumber: "Player 1")
    var playerTwo = Team(playerNumber: "Player 2")
    var round = 0 // Numbers of round in the game

    func showMenu() {
        print("""

                        Hello welcome to fight & Survive

                                Select a number:
                                1 - New Game
                                2 - Exit
                    """)
        switch selectMenu() {
        case 1:
            newGame()
        case 2:
            print("end")
            exit(0)
        default:
            showMenu()
        }
    }

    private func battleBoard() { // Displays the 2 teams composition.
        print("""
                ---------------------------------------------------------------------------------------------------
                                                        ⚜️ \(playerOne.name) ⚜️
                ---------------------------------------------------------------------------------------------------
                """)
        for index in 0...2 { // loop to display the 3 characters of player 1's team
            let char = playerOne.team[index]
            let team1Member = "\(index + 1) | -\(char.logo)  \(char.name) the \(char.type)"
            let stat = "Life = \(char.life) | Damage = \(char.weapon.damage) | Heal = \(char.heal)"
            let weaponLogo = "weapon \(playerOne.team[index].weapon.logo)"
            print("""
                    | \(team1Member)    | \(weaponLogo) | \(stat)
                    ---------------------------------------------------------------------------------------------------
                    """)
        }
        print("""
                ---------------------------------------------------------------------------------------------------
                                                        ⚜️ \(playerTwo.name) ⚜️
                ---------------------------------------------------------------------------------------------------
                """)
        for index in 0...2 { // loop to display the 3 characters of player 2's team
            let char = playerTwo.team[index]
            let team2Member = "\(index + 1) | -\(char.logo)  \(char.name) the \(char.type)"
            let stat = "Life = \(char.life) | Damage = \(char.weapon.damage) | Heal = \(char.heal)"
            let weaponLogo = "weapon \(playerTwo.team[index].weapon.logo)"
            print("""
                    | \(team2Member)    | \(weaponLogo) | \(stat)
                    ---------------------------------------------------------------------------------------------------
                    """)
        }
    }

    private func newGame() {
        playerOne.renameTeam()
        playerOne.selectCharacter()
        playerTwo.controlTeamName(passivePlayer: playerOne) // renameTeam() for playerTwo
        playerTwo.selectCharacter()
        battle()
    }

    private func attackOrHeal(activePlayer: Team, passivePlayer: Team) {
        print("\n\(activePlayer.playerNumber) will choose a fighter in his team now\n")
        print("Please choose a number between 1 and 3 to select your fighter")
        let fighter = activePlayer.askForFighter()
        if fighter.logo == "☠️" { // Check that you cannot choose a player who is already dead for the active phase
            print("\nThis character is dead, you can't select him!\n")
            attackOrHeal(activePlayer: activePlayer, passivePlayer: passivePlayer)
        }
        print("\(activePlayer.playerNumber) has selected \(fighter.logo)  \(fighter.name) the \(fighter.type)\n")
        if let weapon = Chest().open() {
            fighter.weapon = weapon
            fighter.heal = weapon.heal
        }
        print("""
                    do you want to heal a member of your team or attack a character from the opposing team?
                                        1 - Heal
                                        2 - Attack
            """)
        switch selectMenu() {
        case 1:
            print("Choose a number between 1 and 3 to select your character but remember you can't self-heal!")
            let teammate = activePlayer.askForFighter()
            if teammate.name == fighter.name { // Check if the player chooses his own player
                print("\nYou have wasted precious time trying to self-heal, it's your opponent's turn\n")
            } else if teammate.logo == "☠️" && fighter.weapon.logo != "🧪" {// check if teammate alive
                print("You have wasted precious time trying to heal a dead person, it's your opponent's turn")
            } else {
                print("\(activePlayer.playerNumber) has selected \(teammate.logo)  \(teammate.name)\n")
                teammate.life += fighter.heal
                teammate.maxLife()
                if teammate.logo == "☠️" { // If the target healed with the magic potion is dead, it becomes a zombie
                    teammate.logo = "🧟‍♂️"
                }
            }
        case 2:
            print("Please choose a number between 1 and 3 to select the enemy character you want to attack")
            let target = passivePlayer.askForFighter()
            if target.logo == "☠️" { // Check if the player tried to attack a dead person
                print("\nThis enemy is already dead, you lose a precious turn!\n")
            }
            print("\(activePlayer.playerNumber) has selected \(target.logo)  \(target.name) the \(target.type)\n")
            target.life -= fighter.weapon.damage
            if target.isDead() == true {
                print("\n\(target.name) the \(target.type) was killed \n")
            }
        default:
            print("You need to choose between 1 or 2")
        }
    }

    private func battle() {
        var activePlayer = playerOne
        var passivePlayer = playerTwo
        while playerOne.hasAliveFighters() && playerTwo.hasAliveFighters() {
            if round % 2 == 1 { // Change the active player at each turn
                activePlayer = playerTwo
                passivePlayer = playerOne
            } else {
                activePlayer = playerOne
                passivePlayer = playerTwo
            }

            print("\n\n                         🛡ROUND FIGHT NUMBER \(round + 1) ⚔️\n\n")
            battleBoard()
            attackOrHeal(activePlayer: activePlayer, passivePlayer: passivePlayer)
            round += 1
        }
        showResults(winner: activePlayer)
    }

    private func showResults(winner: Team) {
        print("\n             💥💥💥 --- GAME OVER ---💥💥💥             \n")
        print("\n           \(winner.name) wins 👑  in \(round) rounds\n")
        print("\n                            🏆           \n")
        battleBoard()
        showMenu()
        exit(0)
    }

    private func selectMenu() -> Int {
        let number = Selector.betterReadLine()
        guard let myRealNumber = Int(number)  else {
            print("\nThis is not a number")
            return selectMenu()
        }
        guard (1...2).contains(myRealNumber) else {
            print("\nThis is not a valid choice please choose between 1 or 2")
            return selectMenu()
        }
        return myRealNumber
    }
}
