//
//  FormulasUtility.swift
//  esteemator
//
//  Created by Kevin Gómez on 3/10/16.
//  Copyright © 2016 Strategee. All rights reserved.
//

import Foundation


class FormulasUtility {
    
    func numberFormat(baseNumber: Double) -> String {
        let number = baseNumber as NSNumber
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        let converted = numberFormatter.string(from: number)
        
        return converted!
    }
}
