//
//  Selector.swift
//  gamerpg
//
//  Created by Christophe Expleo on 15/04/2021.
//

import Foundation

final class Selector { // Functions for various selections
    static func betterReadLine() -> String {
        if let myReadLine = readLine() {
            return myReadLine
        } else {
            return ""
        }
    }
}
