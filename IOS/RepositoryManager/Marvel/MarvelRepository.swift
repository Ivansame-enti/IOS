//
//  MarvelRepository.swift
//  IOS
//
//  Created by Ivan Sales Mendez on 15/3/24.
//

import Foundation

protocol MarvelRepository {
    
    typealias HeroesResponse = ([Hero]) -> ()
    
    func getHeroes(offset: Int, limit: Int, onSucces: @escaping  HeroesResponse)
}
