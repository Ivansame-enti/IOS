//
//  HeroCell.swift
//  IOS
//
//  Created by Ivan Sales Mendez on 22/3/24.
//

import Foundation
import UIKit

class HeroCell: Cell{
    
    
    @IBOutlet weak var heroImage: ImageV!
    
    @IBOutlet weak var heroName: UILabel!
    
    
    @IBOutlet weak var heroDescription: UITextView!
    
    public func setupWith(hero: Hero){
        
        if let url = hero.thumbnail.Url{
            heroImage.SetImageAsync(url: url)
        }
        
        
        heroName.text = hero.name
        heroDescription.text = hero.description
    }
}
