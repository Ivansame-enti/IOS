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
    
    //@IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var table2: UITableView!
    
    var heroes: [Hero] = []
    var callInProgress = false
    var totalOfHeroes: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table2.dataSource = self
        
        getMoreHeroes()
    }
    
    func getMoreHeroes() {
        
        if(self.callInProgress){
            return
        }
        
        var currentLimit = 20
        
        if let totalOfHeroes = totalOfHeroes{
            let pendentHeroes = totalOfHeroes - heroes.count
            
            if(pendentHeroes <= 0){
                return
            }
            
            if(pendentHeroes < currentLimit){
                currentLimit = pendentHeroes
            }
        }
                
        self.callInProgress = true
        
        RepoManager.Marvel.getHeroes(offset: self.heroes.count, limit: currentLimit) {
            heroes, total in
            
            self.heroes.insert(contentsOf: heroes, at: self.heroes.count)
            self.table2.reloadData()
            
            self.callInProgress = false
            
        }
    }
}

extension HeroesListVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = indexPath.row % 2 == 1 ? "HeroCellLeft" : "HeroCellRight"
        
        guard let heroCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? HeroCell else {
            return Cell()
        }
        
        heroCell.setupWith(hero: heroes[indexPath.row])
        
        if(heroes.count - indexPath.row <= 5){
            getMoreHeroes()
        }
        
        return heroCell
    }
    
    
}
