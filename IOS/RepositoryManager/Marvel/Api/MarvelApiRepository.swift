//
//  MarvelApiRepository.swift
//  IOS
//
//  Created by Ivan Sales Mendez on 15/3/24.
//

import Foundation
import CryptoKit

class MarvelApiRepository : MarvelRepository {
    
    class MarvelURLComponents{
        
        private static let baseURL = "https://gateway.marvel.com:443/v1/public/"
        
        private static let privateKey = "8d5fa0dfdd9aa67ea7d6405f20cc6a45f690685a"
        private static let publicKey = "2b2dfb705116066429385f59302e0a35"
        
        private var components: URLComponents?
        public var Components: URLComponents? {get { return components } }
        
        enum SubPath: String {
            case Characters = "characters"
            case Comics = "comics"
            case Series = "series"
            case Stories = "stories"
        }
        
        init(){
            self.components = URLComponents(string: MarvelApiRepository.MarvelURLComponents.baseURL)
            
            let ts = String(Date().timeIntervalSince1970)
            let hash = MarvelURLComponents.MarvelMD5(string: "\(ts)\(MarvelURLComponents.privateKey)\(MarvelURLComponents.publicKey)"
            )
            
            self.components?.queryItems = [
                URLQueryItem(name: "apikey", value: MarvelURLComponents.publicKey),
                URLQueryItem(name: "ts", value: ts),
                URLQueryItem(name: "hash", value: hash),
            ]
        }
        
        @discardableResult func addToPath(_ subPath: SubPath) -> MarvelURLComponents {
            self.components?.path += subPath.rawValue
            return self
        }
        
        //Overload operator +=
        static func +=(comp: MarvelURLComponents, subPath: SubPath){
            comp.addToPath(subPath)
        }
        
        @discardableResult func addLimit(_ limit: Int) -> MarvelURLComponents {
            self.components?.queryItems?.append(URLQueryItem(name: "limit", value: String(limit)))
            return self
        }
        
        @discardableResult func addOffset(_ offset: Int) -> MarvelURLComponents {
            self.components?.queryItems?.append(URLQueryItem(name: "offset", value: String(offset)))
            return self
        }
        
        static func MarvelMD5(string: String) -> String {
            let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())
            return digest.map {
                String(format: "%02hhx", $0)
            }.joined()
        }
        
    }
}
