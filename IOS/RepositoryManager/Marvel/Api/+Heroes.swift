//
//  +Hero.swift
//  IOS
//
//  Created by Ivan Sales Mendez on 15/3/24.
//

import Foundation

extension MarvelApiRepository {
    
    func getHeroes(offset: Int = 0, limit: Int = 20, onSucces: @escaping MarvelRepository.HeroesResponse) {
        
        let marvelComponents = MarvelURLComponents()
        marvelComponents.addToPath(.Characters)
        marvelComponents.addOffset(offset)
        marvelComponents.addLimit(limit)
        

    }
}
