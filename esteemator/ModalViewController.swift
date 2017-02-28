//
//  ModalViewController.swift
//  esteemator
//
//  Created by Marketing Automation on 10/10/16.
//  Copyright © 2016 Strategee. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton! 
    @IBOutlet weak var labelSales: UILabel!
    @IBOutlet weak var labelMinCost: UILabel!
    @IBOutlet weak var labelMerge: UILabel!
    @IBOutlet weak var labelMinCostExpenses: UILabel!
    @IBOutlet weak var labelBeforeImp: UILabel!
    @IBOutlet weak var labelAveragePrice: UILabel!
    @IBOutlet weak var labelBreakeven: UILabel!
    @IBOutlet weak var labelMinRoyalties: UILabel!
    @IBOutlet weak var labelSalesBefore: UILabel!
    @IBOutlet weak var labelSalesAffter: UILabel!
    @IBOutlet weak var labelMinCostBefore: UILabel!
    @IBOutlet weak var labelMinCostAffter: UILabel!
    @IBOutlet weak var labelGrossMarginBef: UILabel!
    @IBOutlet weak var labelGrossMarginAff: UILabel!
    @IBOutlet weak var labelUnityNetBeforeImp: UILabel!
    @IBOutlet weak var labelTax: UILabel!
    @IBOutlet weak var labelUnityNeta: UILabel!
    @IBOutlet weak var labelheritageExposed: UILabel!
    @IBOutlet weak var labelEquityRequired: UILabel!
    
    @IBOutlet weak var threeScrollView: UIScrollView!
    @IBOutlet weak var SixScrollView: UIScrollView!
    @IBOutlet weak var nineScrollView: UIScrollView!
    

    var formulasUtility = FormulasUtility()
    
    
    // Formula 0
    var tipoPrueba: String = ""
    var sales = Double()
    var minCostSales = Double()

    
    // Formula 1 , 2
    var cost = Double()
    var margeNeto = Double()
    var opeExpenses = Double()
    
    // Formula 3
    var priceByUnity = Double()
    var breakeven = Double()
    
    // Formula 4
    var desiredUtily = Double()
    
    // Formula 5
    var royaltiesValue = Double()
    
    // Formula 6 
    var porcentDiscont = Double()
    var priceBefore = Double()
    var thresholdForDiscount = Double()
    var unityNewPrice = Double()
    var unityCost = Double()
    
    // Formula 7
    var resulSend:(salesThresholdDiscount:Double, unityNewPrice:Double, unityCost:Double, averageSalesByUnity:Double, priceUnityDiscount:Double) = (0.0,0.0,0.0,0.0,0.0)

    // Formula 9 
    var formulaNine:(levelRequiredSales:Double,costMerchandise:Double,grossMargin:Double,operatingCost:Double,netIncomeAofI:Double,financialExpenses:Double,
        netIncomeBeforeTax:Double,tax:Double,unityNet:Double,heritageExposed:Double, equityRequired:Double) = (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)

    // Formula 10
    var resulTen:(salesBudgetNetBeforeImp:Double,costMerchandise:Double,grossProfitSales:Double,operatingCost:Double,operationalUtility:Double,financialExpenses:Double,
        netIncomeBeforeImp:Double,incomeTaxes:Double,netIncomeAfterImp:Double) = (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)
    
    override func viewDidLoad() {
        closeButton.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
        validationRule()
        
        if (threeScrollView != nil) { threeScrollView.contentSize.height = 667 }
        if (SixScrollView != nil) { SixScrollView.contentSize.height = 667 }
        if (nineScrollView != nil) { nineScrollView.contentSize.height = 700 }

    }
    
    func validationRule() {
        if tipoPrueba == "Prueba_venta_deseada" {   // Free
            let _resulmerge = sales - minCostSales
            labelSales.text = formulasUtility.numberFormat(baseNumber: sales)
            labelMinCost.text = formulasUtility.numberFormat(baseNumber: minCostSales)
            labelMerge.text = formulasUtility.numberFormat(baseNumber: _resulmerge)
            
        } else if tipoPrueba == "Prueba_porcentaje_margen" { // 1
            let _grossMargin = sales - cost
            let _costExpenses = sales * opeExpenses / 100
            let _utilityBeforeImp = _grossMargin - _costExpenses
            
            labelSales.text = formulasUtility.numberFormat(baseNumber: sales)
            labelMinCost.text = formulasUtility.numberFormat(baseNumber: cost)
            labelMerge.text = formulasUtility.numberFormat(baseNumber: _grossMargin)
            labelMinCostExpenses.text = formulasUtility.numberFormat(baseNumber: _costExpenses)
            labelBeforeImp.text = formulasUtility.numberFormat(baseNumber: _utilityBeforeImp)
            
        } else if tipoPrueba == "Punto_equilibrio_dinero" { // 2
            let _minCostSale = sales * (1 - margeNeto / 100)
            let _grossMargin = sales - _minCostSale
            let _utilityBeforeImp = _grossMargin - cost
            
            labelSales.text = formulasUtility.numberFormat(baseNumber: sales)
            labelMinCost.text = formulasUtility.numberFormat(baseNumber: _minCostSale)
            labelMerge.text = formulasUtility.numberFormat(baseNumber: _grossMargin)
            labelMinCostExpenses.text = formulasUtility.numberFormat(baseNumber: cost)
            labelBeforeImp.text = formulasUtility.numberFormat(baseNumber: _utilityBeforeImp)
            
        } else if tipoPrueba == "Punto_equilibrio_unidades" { // 3
            let _minCostSale = sales * (1 - margeNeto / 100)
            let _grossMargin = sales - _minCostSale
            let _utilityBeforeImp = _grossMargin - cost
            
            labelSales.text = formulasUtility.numberFormat(baseNumber: sales)
            labelMinCost.text = formulasUtility.numberFormat(baseNumber: _minCostSale)
            labelMerge.text = formulasUtility.numberFormat(baseNumber: _grossMargin)
            labelMinCostExpenses.text = formulasUtility.numberFormat(baseNumber: cost)
            labelBeforeImp.text = formulasUtility.numberFormat(baseNumber: _utilityBeforeImp)
            labelAveragePrice.text = formulasUtility.numberFormat(baseNumber: priceByUnity)
            labelBreakeven.text = String(breakeven)
        
        } else if tipoPrueba == "Ventas_nivel_gasto" { // 4
            let _minCostSale = sales * (1 - margeNeto / 100)
            let _grossMargin = sales - _minCostSale
            let _utilityBeforeImp = _grossMargin - cost
            
            labelSales.text = formulasUtility.numberFormat(baseNumber: sales)
            labelMinCost.text = formulasUtility.numberFormat(baseNumber: _minCostSale)
            labelMerge.text = formulasUtility.numberFormat(baseNumber: _grossMargin)
            labelMinCostExpenses.text = formulasUtility.numberFormat(baseNumber: cost)
            labelBeforeImp.text = formulasUtility.numberFormat(baseNumber: _utilityBeforeImp)
       
        } else if tipoPrueba == "Ventas_minimas_gasto_mensuales" {  // 5
            let _minCostSale = sales * (1 - margeNeto / 100)
            let _grossMargin = sales - _minCostSale
            let _minRoyalties = sales * royaltiesValue / 100
            let _utilityBeforeImp = _grossMargin - cost - _minRoyalties
            
            labelSales.text = formulasUtility.numberFormat(baseNumber: sales)
            labelMinCost.text = formulasUtility.numberFormat(baseNumber: _minCostSale)
            labelMerge.text = formulasUtility.numberFormat(baseNumber: _grossMargin)
            labelMinCostExpenses.text = formulasUtility.numberFormat(baseNumber: cost)
            labelMinRoyalties.text = formulasUtility.numberFormat(baseNumber: _minRoyalties)
            labelBeforeImp.text = formulasUtility.numberFormat(baseNumber: _utilityBeforeImp)
       
        } else if tipoPrueba == "Umbral_minimo_de_ventas" {  // 5
             
            let _salesBefor = unityNewPrice * thresholdForDiscount
            let _minCostBef = unityCost * thresholdForDiscount
            let _grossMarginBef = _salesBefor - _minCostBef
            
            labelSalesBefore.text = formulasUtility.numberFormat(baseNumber: _salesBefor)
            labelMinCostBefore.text = formulasUtility.numberFormat(baseNumber: _minCostBef)
            labelGrossMarginBef.text = formulasUtility.numberFormat(baseNumber: _grossMarginBef)
       
            let _salesAffer = priceBefore * cost
            let _minCostAff =  unityCost * cost
            let _grossMarginAff = _salesAffer - _minCostAff
            
            labelSalesAffter.text = formulasUtility.numberFormat(baseNumber: _salesAffer)
            labelMinCostAffter.text = formulasUtility.numberFormat(baseNumber: _minCostAff)
            labelGrossMarginAff.text = formulasUtility.numberFormat(baseNumber: _grossMarginAff)
            
        } else if tipoPrueba == "Umbral_incremento_de_actividad" {
            let _salesBefor = resulSend.unityNewPrice * resulSend.salesThresholdDiscount
            let _minCostBef = resulSend.unityCost * resulSend.salesThresholdDiscount
            let _grossMarginBef = _salesBefor - _minCostBef
            
            labelSalesBefore.text = formulasUtility.numberFormat(baseNumber: _salesBefor)
            labelMinCostBefore.text = formulasUtility.numberFormat(baseNumber: _minCostBef)
            labelGrossMarginBef.text = formulasUtility.numberFormat(baseNumber: _grossMarginBef)
            
            let _salesAffer = resulSend.priceUnityDiscount * resulSend.averageSalesByUnity
            let _minCostAff =  resulSend.unityCost * resulSend.averageSalesByUnity
            let _grossMarginAff = _salesAffer - _minCostAff
            
            labelSalesAffter.text = formulasUtility.numberFormat(baseNumber: _salesAffer)
            labelMinCostAffter.text = formulasUtility.numberFormat(baseNumber: _minCostAff)
            labelGrossMarginAff.text = formulasUtility.numberFormat(baseNumber: _grossMarginAff)
 
        } else if tipoPrueba == "Presupuesto_Anual_de_ventas" {
            labelSales.text = formulasUtility.numberFormat(baseNumber: formulaNine.levelRequiredSales)
            labelMinCost.text = formulasUtility.numberFormat(baseNumber: formulaNine.costMerchandise)
            labelMerge.text = formulasUtility.numberFormat(baseNumber: formulaNine.grossMargin)
            labelMinCostExpenses.text = formulasUtility.numberFormat(baseNumber: formulaNine.operatingCost)
            labelBeforeImp.text = formulasUtility.numberFormat(baseNumber: formulaNine.netIncomeAofI)
            labelAveragePrice.text = formulasUtility.numberFormat(baseNumber: formulaNine.financialExpenses)
            labelUnityNetBeforeImp.text = formulasUtility.numberFormat(baseNumber: formulaNine.netIncomeBeforeTax)
            labelTax.text = formulasUtility.numberFormat(baseNumber: formulaNine.tax)
            labelUnityNeta.text = formulasUtility.numberFormat(baseNumber: formulaNine.unityNet)
            labelheritageExposed.text = formulasUtility.numberFormat(baseNumber: formulaNine.heritageExposed)
            labelEquityRequired.text = formulasUtility.numberFormat(baseNumber: formulaNine.equityRequired)
        }
        else if tipoPrueba == "Presupuesto_Anual_de_ventas_con_Gastos_Anuales" {
            labelSales.text = formulasUtility.numberFormat(baseNumber: resulTen.salesBudgetNetBeforeImp)
            labelMinCost.text = formulasUtility.numberFormat(baseNumber: resulTen.costMerchandise)
            labelMerge.text = formulasUtility.numberFormat(baseNumber: resulTen.grossProfitSales)
            labelMinCostExpenses.text = formulasUtility.numberFormat(baseNumber: resulTen.operatingCost)
            labelBeforeImp.text = formulasUtility.numberFormat(baseNumber: resulTen.operationalUtility)
            labelAveragePrice.text = formulasUtility.numberFormat(baseNumber: resulTen.financialExpenses)
            labelUnityNetBeforeImp.text = formulasUtility.numberFormat(baseNumber: resulTen.netIncomeBeforeImp)
            labelTax.text = formulasUtility.numberFormat(baseNumber: resulTen.incomeTaxes)
            labelUnityNeta.text = formulasUtility.numberFormat(baseNumber: resulTen.netIncomeAfterImp)
           
        }
   }

    
   
    @IBAction func closeAction(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIApplication.shared.setStatusBarStyle(.default, animated: true)
    }

    
}
