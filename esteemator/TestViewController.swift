//
//  TestViewController.swift
//  esteemator
//
//  Created by Kevin Gómez on 3/10/16.
//  Copyright © 2016 Strategee. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var sales: UILabel!
    @IBOutlet weak var totalCost: UILabel!
    @IBOutlet weak var range: UILabel!

    
    var result:[String]?
    
    var oneresult = "";
    var seconresult:String?
    
    
   
    
    override func viewDidLoad() {

        if let resultLabelsales = result?[0] {
            let salestotal = resultLabelsales
            
            sales.text = salestotal
        }
        
    // Do any additional setup after loading the view.
    }
    
   
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
