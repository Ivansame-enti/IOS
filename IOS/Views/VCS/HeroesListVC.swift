//
//  HeroesListVC.swift
//  IOS
//
//  Created by Ivan Sales Mendez on 8/3/24.
//

import Foundation
import UIKit

struct Pokemon: Codable {
    let name: String
    let sprites: PokemonSprites
}

struct PokemonSprites: Codable {
    let back: String
    let front: String
    
    enum CodingKeys: String, CodingKey{
        case back = "back_default"
        case front = "front_default"
    }
}

struct Digimon: Codable {
    let id: Int
    let name: String
    let types: [DigimonTypes]
    let skills: [DigimonSkills]
}

struct DigimonTypes: Codable {
    let id: Int
    let type: String
}

struct DigimonSkills: Codable {
    let id: Int
    let skill: String
    let description: String
}

class HeroesListVC: VC{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RepoManager.Marvel.getHeroes(offset: 0, limit: 20) {
            heroes in let i = 0
        }
    }
}
