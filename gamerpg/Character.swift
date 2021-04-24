//
//  Character.swift
//  gamerpg
//
//  Created by Christophe Expleo on 29/03/2021.
//

import Foundation

class Character {
    static var names: [String] = [] // array to store character names
    let type: String
    var life: Int
    let firstLife: Int // Stores the initial life points before any change on them
    var weapon: Weapon
    var heal: Int
    let genre: String
    var logo: String
    var name = String()

    init(type: String, life: Int, weapon: Weapon, heal: Int, genre: String, logo: String) {
        self.type = type
        self.life = life
        self.heal = heal
        self.genre = genre
        self.logo = logo
        self.weapon = weapon
        firstLife = life
    }

    func isDead() -> Bool { // Control if Character is alive
        if life <= 0 {
            life = 0
            heal = 0
            logo = "☠️"
            weapon = Weapon.skullWeapon
        }
        return life <= 0
    }

    func maxLife() { // Prevent to heal more than the total number of life points
        if life > firstLife {
            life = firstLife
        }
    }
}

final class Ninja: Character {
    init() {
        super.init(type: "ninja", life: 10, weapon: Weapon.katana, heal: 4, genre: "M", logo: "🥷🏻")
    }
}

final class Magician: Character {
    init() {
        super.init(type: "magician", life: 8, weapon: Weapon.magicWand, heal: 4, genre: "M", logo: "🧙‍♂️")
    }
}

final class Clown: Character {
    init() {
        super.init(type: "clown", life: 6, weapon: Weapon.boxingGlove, heal: 5, genre: "M", logo: "🤡")
    }
}

final class SuperHero: Character {
    init() {
        super.init(type: "superHero", life: 12, weapon: Weapon.iphone, heal: 3, genre: "F", logo: "🦸🏻‍♀️")
    }
}

final class Santa: Character {
    init() {
        super.init(type: "santa", life: 6, weapon: Weapon.belt, heal: 6, genre: "M", logo: "🎅🏻")
    }
}

final class Elf: Character {
    init() {
        super.init(type: "elf", life: 5, weapon: Weapon.secretWeapon, heal: 8, genre: "", logo: "🧝‍♀️")
    }
}
