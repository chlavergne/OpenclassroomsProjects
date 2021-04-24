//
//  Chest.swift
//  gamerpg
//
//  Created by Christophe Expleo on 21/04/2021.
//

import Foundation

final class Chest {
    func open() -> Weapon? { // Randomly spawns 3 different weapons
        if Int.random(in: 0...9) == 1 {
            print("""
                You just found a secret chest box  🗃 with Lightsaber 🖍.
                Your character now has a devastating attack that kills his enemy in a single attack,
                but since he is forced to use both hands, he can no longer heal one of his teammates.
                """)
            return Weapon.chestWeapon1 // Lightsaber
        } else if Int.random(in: 0...9) == 3 {
            print("""
                You just found a secret chest box 🗃 with a broken sword 🦯.
                Your character cannot do damage with this weapon and since he is obliged to use his 2 hands,
                he can no longer heal one of his teammates.
                """)
            return Weapon.chestWeapon2 // Broken sword
        } else if Int.random(in: 0...9) == 6 {
            print("""
                You just found a secret chest box 🗃 with a magic potion 🧪.
                Your character must separate from his weapon to be able to use it
                and he can no longer attack but he now has the ability to fully restore the life of one of his teammates
                """)
            return Weapon.chestWeapon3 // Magic potion Bonus: Can transform Dead character in Zombie
        }
        return nil
    }
}
