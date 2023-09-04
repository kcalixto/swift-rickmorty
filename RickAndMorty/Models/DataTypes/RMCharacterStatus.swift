//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Kaua Calixto on 03/09/23.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
//    since it may be a keywork we must put into `
    case `unknown` = "Unknown"
}
