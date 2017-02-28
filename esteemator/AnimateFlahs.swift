//
//  AnimateFlahs.swift
//  esteemator
//
//  Created by Marketing Automation on 18/10/16.
//  Copyright © 2016 Strategee. All rights reserved.
//

import UIKit

class AnimateFlahs: UILabel {

    func flash() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.alpha = 1.0
        }) { ( animationComplete) in
            if animationComplete == true {
                UIView.animate(withDuration: 0.3, delay: 2.0, options: .curveEaseOut, animations: {
                    self.alpha = 0.0
                    }, completion: nil)
            }
        }
    }

}
