//
//  AnimationJitter.swift
//  esteemator
//
//  Created by Marketing Automation on 17/10/16.
//  Copyright © 2016 Strategee. All rights reserved.
//

import UIKit

extension UIView {
    
    func jitter() {
        let animations = CABasicAnimation(keyPath: "position")
        animations.duration = 0.05
        animations.repeatCount = 3
        animations.autoreverses = true
        animations.fromValue = NSValue(cgPoint: CGPoint.init(x: self.center.x - 5.0, y: self.center.y ))
        animations.toValue = NSValue(cgPoint: CGPoint.init(x: self.center.x + 5.0, y: self.center.y))
        layer.add(animations, forKey: "position")
    }
    
}
