//
//  Weapon.swift
//  gamerpg
//
//  Created by Christophe Expleo on 29/03/2021.
//

import Foundation

final class Weapon {
    static var skullWeapon = Weapon(logo: "✝︎", name: "bones", damage: 0, heal: 0) // Remove weapon from dead players

    static var chestWeapon1 = Weapon(logo: "🖍", name: "lightSaber", damage: 100, heal: 0) // bonus weapon
    static var chestWeapon2 = Weapon(logo: "🦯", name: "brokenSword", damage: 0, heal: 0) // bonus weapon
    static var chestWeapon3 = Weapon(logo: "🧪", name: "magicPotion", damage: 0, heal: 100) // bonus weapon

    static var katana = Weapon(logo: "🗡", name: "Katana", damage: 4, heal: 0) // Ninja starting weapon
    static var magicWand = Weapon(logo: "🪄", name: "Baguette Magique", damage: 6, heal: 0) // Magician starting weapon
    static var boxingGlove = Weapon(logo: "🥊", name: "Gant de boxe", damage: 7, heal: 0) //  Clown starting weapon
    static var iphone = Weapon(logo: "🤳", name: "Iphone", damage: 3, heal: 0) // SuperHero starting weapon
    static var belt = Weapon(logo: "🦺", name: "Ceinturon", damage: 6, heal: 0) // Santa starting weapon
    static var secretWeapon = Weapon(logo: "🍌", name: "Secret d'Elf", damage: 5, heal: 0) // Elf starting weapon

    var logo: String
    var damage: Int
    var heal: Int
    let name: String

    init(logo: String, name: String, damage: Int, heal: Int) {
        self.logo = logo
        self.name = name
        self.damage = damage
        self.heal = heal
    }
}
