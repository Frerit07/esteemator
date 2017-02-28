//
//  DataTestViewController.swift
//  esteemator
//
//  Created by Marketing Automation on 11/10/16.
//  Copyright © 2016 Strategee. All rights reserved.
//

import UIKit

class DataTestViewController: UIViewController {

    @IBOutlet weak var labelTest: UILabel!
    @IBOutlet weak var labelMinCost: UILabel!
    @IBOutlet weak var labelSales: UILabel!
    
    var  sendLabelSales = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelSales.text = sendLabelSales
    }
}
