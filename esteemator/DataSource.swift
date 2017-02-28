//
//  DataSource.swift
//  esteemator
//
//  Created by Kevin Gómez on 27/09/16.
//  Copyright © 2016 Strategee. All rights reserved.
//

import Foundation

class DataSource {
    init() {
        populateData()
    }
    
    var formulas: [Formula] = []

    func populateData(){
        if let path = Bundle.main.path(forResource: "formulasData", ofType: "plist"){
            if let dictArray = NSArray(contentsOfFile: path){
                for item in dictArray {
                    if let dict = item as? NSDictionary{
                        let name = dict["formulaName"] as! String
                        let image = dict["formulaImage"] as! String
                        
                        let formula = Formula(name: name, image: image)
                        
                        formulas.append(formula)
                    }
                }
            }
        
        }
    }
}

