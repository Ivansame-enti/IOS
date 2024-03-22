//
//  UIView+Constraints.swift
//  IOS
//
//  Created by Ivan Sales Mendez on 22/3/24.
//

import Foundation
import UIKit

extension UIView {
    
    
    public enum ConstraintType {
        case Lesser
        case Equal
        case Greater
    }
    
    @discardableResult
    func activateConstraints() -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    //MARK: Aligns
    
    //MARK: Horizontal align
    @discardableResult
    func alignLeftConstraint(other: UIView, padding: CGFloat = 0, type: ConstraintType = .Equal, safeArea: Bool = true, activated: Bool = true) -> NSLayoutConstraint{
        
        let constraint: NSLayoutConstraint
        
        let otherLeadingAnchor = safeArea ? other.safeAreaLayoutGuide.leadingAnchor : other.leadingAnchor
        
        switch(type){
        case .Lesser:
            constraint = self.leadingAnchor.constraint(lessThanOrEqualTo: otherLeadingAnchor, constant: padding)
        case .Equal:
            constraint = self.leadingAnchor.constraint(equalTo: otherLeadingAnchor, constant: padding)
        case .Greater:
            constraint = self.leadingAnchor.constraint(greaterThanOrEqualTo: otherLeadingAnchor, constant: padding)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult
    func alignLeftTo(_ other: UIView, padding: CGFloat = 0, type: ConstraintType = .Equal, safeArea: Bool = true) -> UIView{
        
        alignLeftConstraint(other: other, padding: padding, type: type, safeArea: safeArea)
        return self
    }
    
    @discardableResult
    func alignRightConstraint(other: UIView, padding: CGFloat = 0, type: ConstraintType = .Equal, safeArea: Bool = true, activated: Bool = true) -> NSLayoutConstraint{
        
        let constraint: NSLayoutConstraint
        
        let otherTrailingAnchor = safeArea ? other.safeAreaLayoutGuide.trailingAnchor : other.trailingAnchor
        
        switch(type){
        case .Lesser:
            constraint = self.trailingAnchor.constraint(lessThanOrEqualTo: otherTrailingAnchor, constant: -padding)
        case .Equal:
            constraint = self.trailingAnchor.constraint(equalTo: otherTrailingAnchor, constant: -padding)
        case .Greater:
            constraint = self.trailingAnchor.constraint(greaterThanOrEqualTo: otherTrailingAnchor, constant: -padding)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult
    func alignRightTo(_ other: UIView, padding: CGFloat = 0, type: ConstraintType = .Equal, safeArea: Bool = true) -> UIView{
        
        alignRightConstraint(other: other, padding: padding, type: type, safeArea: safeArea)
        return self
    }
    
    //MARK: Vertical align
    @discardableResult
    func alignTopConstraint(other: UIView, padding: CGFloat = 0, type: ConstraintType = .Equal, safeArea: Bool = true, activated: Bool = true) -> NSLayoutConstraint{
        
        let constraint: NSLayoutConstraint
        
        let otherTopAnchor = safeArea ? other.safeAreaLayoutGuide.topAnchor : other.topAnchor
        
        switch(type){
        case .Lesser:
            constraint = self.topAnchor.constraint(lessThanOrEqualTo: otherTopAnchor, constant: padding)
        case .Equal:
            constraint = self.topAnchor.constraint(equalTo: otherTopAnchor, constant: padding)
        case .Greater:
            constraint = self.topAnchor.constraint(greaterThanOrEqualTo: otherTopAnchor, constant: padding)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult
    func alignTopTo(_ other: UIView, padding: CGFloat = 0, type: ConstraintType = .Equal, safeArea: Bool = true) -> UIView{
        
        alignTopConstraint(other: other, padding: padding, type: type, safeArea: safeArea)
        return self
    }
    
    @discardableResult
    func alignBotConstraint(other: UIView, padding: CGFloat = 0, type: ConstraintType = .Equal, safeArea: Bool = true, activated: Bool = true) -> NSLayoutConstraint{
        
        let constraint: NSLayoutConstraint
        
        let otherBotAnchor = safeArea ? other.safeAreaLayoutGuide.bottomAnchor : other.bottomAnchor
        
        switch(type){
        case .Lesser:
            constraint = self.bottomAnchor.constraint(lessThanOrEqualTo: otherBotAnchor, constant: -padding)
        case .Equal:
            constraint = self.bottomAnchor.constraint(equalTo: otherBotAnchor, constant: -padding)
        case .Greater:
            constraint = self.bottomAnchor.constraint(greaterThanOrEqualTo: otherBotAnchor, constant: -padding)
        }
        
        constraint.isActive = activated
        
        return constraint
    }
    
    @discardableResult
    func alignBotTo(_ other: UIView, padding: CGFloat = 0, type: ConstraintType = .Equal, safeArea: Bool = true) -> UIView{
        
        alignBotConstraint(other: other, padding: padding, type: type, safeArea: safeArea)
        return self
    }
    
    //MARK: Center Aligns
        //TODO: X
        //TODO: Y
        
    //MARK: Relatives
        //TODO: Arriba de
        //TODO: Debajo de
        //TODO: Izquierda de
        //TODO: Derecha de
    
    
    //MARK: Helpers
    
    @discardableResult
    func pinTo(_ other: UIView, padding: CGFloat = 0, safeArea: Bool = true) -> UIView {
        
        self.activateConstraints().alignTopTo(other, padding: padding, safeArea: safeArea).alignLeftTo(other, padding: padding, safeArea: safeArea).alignRightTo(other, padding: padding, safeArea: safeArea).alignBotTo(other, padding: padding, safeArea: safeArea)
        
        return self
    }
    
    
}
