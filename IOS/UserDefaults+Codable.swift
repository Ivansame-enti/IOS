//
//  UserDefaults+Codable.swift
//  IOS
//
//  Created by Ivan Sales Mendez on 1/3/24.
//

import Foundation

extension UserDefaults{
    
    @discardableResult
    func save(_ data: Codable, key: String) -> Bool{
        let encoder = JSONEncoder()
        
        if let encoded: Data = try? encoder.encode(data){
            self.set(encoded, forKey: key)
            return true
        }
        
        return false
    }
    
    func read<T: Codable>(_ t: T.Type, key: String) -> T? {
        
        if let data: Data = self.object(forKey: key) as? Data{
            let decoder = JSONDecoder()
            if let dataObj = try? decoder.decode(T.self, from: data){
                return dataObj
            }
        }
        
        return nil
    }
    
}
