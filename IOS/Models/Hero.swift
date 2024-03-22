//
//  Hero.swift
//  IOS
//
//  Created by Ivan Sales Mendez on 15/3/24.
//

import Foundation

struct HeroImagePath: Codable {
    let path: String
    let `extension`: String
    
    var ImagePath: String{
        get{return "\(path).\(`extension`)"}
    }
    var Url: URL? {
        get {return URL(string: ImagePath)}
    }
}

struct Hero: Codable {
    let id: Int
    let name: String
    let description: String?
    let thumbnail: HeroImagePath
}

extension MarvelApiRepository {
    
    struct HeroesFetchData: Codable {
        let offset: Int
        let limit: Int
        let total: Int
        let count: Int
        let results: [Hero]
    }
    
    struct HeroesResponse: Codable {
        let code: Int
        let data: HeroesFetchData
    }
    
}

