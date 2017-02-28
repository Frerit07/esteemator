//
//  PorcentalTableViewController.swift
//  esteemator
//
//  Created by Marketing Automation on 17/10/16.
//  Copyright © 2016 Strategee. All rights reserved.
//

import UIKit

protocol DataSendDelegate {
    func userDidEnterData(data:String)
}

class PorcentalTableViewController: UITableViewController {
    
    var selection = Double()
    
    var porcentual = [42,41,40,39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20,17.5,12.5,10,5]
    
    var delegate: DataSendDelegate? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return porcentual.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = String(porcentual[indexPath.row]) + "%"
        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if delegate != nil {
            selection = Double(porcentual[indexPath.row])
            dismiss(animated: true, completion: nil)
            delegate?.userDidEnterData(data: String(selection))
    }
}

    

}
