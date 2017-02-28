//
//  EsteematorViewController.swift
//  esteemator
//
//  Created by Kevin Gómez on 27/09/16.
//  Copyright © 2016 Strategee. All rights reserved.
//

import UIKit

class EsteematorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var formulasTableView: UITableView!
    
    
    let dataSource = DataSource();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nav = self.navigationController?.navigationBar
        
        nav?.tintColor = UIColor.white
        
        let imagenView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imagenView.contentMode = .scaleAspectFit
        
        let image = UIImage(named: "navigation")
        imagenView.image = image
        
        navigationItem.titleView = imagenView
        
        imagenView.isUserInteractionEnabled = true
        let GestureTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(EsteematorViewController.imagenTaper))
        imagenView.addGestureRecognizer(GestureTap)
    }
    
    func imagenTaper() {
        print("Imagen preset")
        
        let url = URL(string: "http://es.strategee.us")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        if( indexPath.row == 0 ){
            cell = Bundle.main.loadNibNamed("CellForm0", owner: self, options: nil)?.first as! CellForm0
        }else if( indexPath.row == 1 ){
            cell = Bundle.main.loadNibNamed("CellForm1", owner: self, options: nil)?.first as! CellForm1
        }else if( indexPath.row == 2 ){
            cell = Bundle.main.loadNibNamed("CellForm2", owner: self, options: nil)?.first as! CellForm2
        }else if( indexPath.row == 3 ){
            cell = Bundle.main.loadNibNamed("CellForm3", owner: self, options: nil)?.first as! CellForm3
        }else if( indexPath.row == 4 ){
            cell = Bundle.main.loadNibNamed("CellForm4", owner: self, options: nil)?.first as! CellForm4
        }else if( indexPath.row == 5 ){
            cell = Bundle.main.loadNibNamed("CellForm5", owner: self, options: nil)?.first as! CellForm5
        }else if( indexPath.row == 6 ){
            cell = Bundle.main.loadNibNamed("CellForm6", owner: self, options: nil)?.first as! CellForm6
        }else if( indexPath.row == 7 ){
            cell = Bundle.main.loadNibNamed("CellForm7", owner: self, options: nil)?.first as! CellForm7
        }else if( indexPath.row == 8 ){
            cell = Bundle.main.loadNibNamed("CellForm8", owner: self, options: nil)?.first as! CellForm8
        }else if( indexPath.row == 9 ){
            cell = Bundle.main.loadNibNamed("CellForm9", owner: self, options: nil)?.first as! CellForm9
        }else if( indexPath.row == 10 ){
            cell = Bundle.main.loadNibNamed("CellForm10", owner: self, options: nil)?.first as! CellForm10
        }
        
        return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "formulaOneSegue", sender: self)
            break
        case 1:
            self.performSegue(withIdentifier: "formulaTwoSegue", sender: self)
            break
        case 2:
            self.performSegue(withIdentifier: "formulaThreeSegue", sender: self)
            break
        case 3:
            self.performSegue(withIdentifier: "formulaFourSegue", sender: self)
            break
        case 4:
            self.performSegue(withIdentifier: "formulaFiveSegue", sender: self)
            break
        case 5:
            self.performSegue(withIdentifier: "formulaSixSegue", sender: self)
            break
        case 6:
            self.performSegue(withIdentifier: "formulaSevenSegue", sender: self)
            break
        case 7:
            self.performSegue(withIdentifier: "formulasSeventSegue", sender: self)
            break
        case 8:
            self.performSegue(withIdentifier: "formulasEightSegue", sender: self)
            break
        case 9:
            self.performSegue(withIdentifier: "formulasNineSegue", sender: self)
            break
        case 10:
            self.performSegue(withIdentifier: "formulasTenSegue", sender: self)
            break
        default:
            self.performSegue(withIdentifier: "formulaOneSegue", sender: self)
            break
        }
    }

}
