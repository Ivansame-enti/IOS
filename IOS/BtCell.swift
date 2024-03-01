//
//  BtCell.swift
//  IOS
//
//  Created by Ivan Sales Mendez on 1/3/24.
//

import Foundation
import UIKit

class BtCell: UITableViewCell{
    
    typealias OnClick = () -> ()
    
    var onClick: OnClick?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        self.isUserInteractionEnabled = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.onTap))
        
        self.addGestureRecognizer(gesture)
    }
    
    @objc func onTap(){
        self.onClick?()
    }
}
