//
//  StartVC.swift
//  IOS
//
//  Created by Ivan Sales Mendez on 22/3/24.
//

import Foundation
import UIKit

class StartVC: VC {
    
    override func viewDidLoad() {
        
        //cambiar color de fondo
        self.view.backgroundColor = .gray
        
        //crear ui view
        let codeView = UIView()
        codeView.backgroundColor = .blue
        
        //mete la view en la jerarquia
        self.view.addSubview(codeView)
        
        /*//le quita las constrains
        codeView.translatesAutoresizingMaskIntoConstraints = false
    
        //constrain v1
        let centerX = codeView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        centerX.isActive = true
        
        //constrain v2
        codeView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 100).isActive = true
        
        //constrain v3
        NSLayoutConstraint.activate([
            codeView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5),
            //constrain v4
            NSLayoutConstraint(item: codeView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1, constant: -300)
        ])*/
        
        /*codeView.enableConstrains()
            .centerX(self.view)
            .centerY(self.view, constant: 100)
            .equalWidth(self.view, multiplier: 0.5)
            .equalHeight(self.view, constant: -300)*/
    }
}
