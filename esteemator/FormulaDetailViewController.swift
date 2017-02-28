//
//  FormulaDetailViewController.swift
//  esteemator
//
//  Created by Kevin Gómez on 27/09/16.
//  Copyright © 2016 Strategee. All rights reserved.
//

import UIKit
import BubbleTransition

class FormulaDetailViewController: UIViewController, UIViewControllerTransitioningDelegate, DataSendDelegate {

    @IBOutlet weak var ProductTotalCost: UITextField!
    @IBOutlet weak var desiredRange: UITextField!
    @IBOutlet weak var subtotalAct: UILabel!
    @IBOutlet weak var resultFormula: UILabel!
    @IBOutlet weak var secondFormulaResult: UILabel!
    @IBOutlet weak var thirdFormulaResult: UILabel!
    @IBOutlet weak var fourFormulaResul: UILabel!
    @IBOutlet weak var newCostFormulaResult: UILabel!
    @IBOutlet weak var costFormulaResult: UILabel!
    @IBOutlet weak var operationalExpenses: UITextField!
    @IBOutlet weak var averageGrossMargin: UITextField!
    @IBOutlet weak var priceByUnit: UITextField!
    @IBOutlet weak var desiredUtility: UITextField!
    @IBOutlet weak var valueRoyalties: UITextField!
    @IBOutlet weak var averageSalesByUnity: UITextField!
    @IBOutlet weak var discountPercentage: UITextField!
    @IBOutlet weak var unityPricePreDiscount: UITextField!
    
    @IBOutlet weak var mesageLabelError: AnimateFlahs!
    @IBOutlet weak var messageLabelError: AnimateFlahs!
    @IBOutlet weak var transitionButon: UIButton!
    
    @IBOutlet weak var annualExpenses: UITextField!
    @IBOutlet weak var taxPercentage: UITextField!
    @IBOutlet weak var annualFinancial: UITextField!
    @IBOutlet weak var heritageExposed: UITextField!
    @IBOutlet weak var requiredEquity: UITextField!
    @IBOutlet weak var levelRequiredSales: UILabel!
   
    
    @IBOutlet weak var actPersonal: UITextField!
    @IBOutlet weak var actUniform: UITextField!
    @IBOutlet weak var actCustomerAwars: UITextField!
    @IBOutlet weak var actTastings: UITextField!
    @IBOutlet weak var actoverTimeCharge: UITextField!
    @IBOutlet weak var actAidTransport: UITextField!
    @IBOutlet weak var actFurnitureCost: UITextField!
    @IBOutlet weak var actPricebyUnityDiscount: UITextField!
    @IBOutlet weak var actOther: UITextField!
    
    @IBOutlet weak var porcentCostoFinancial: UILabel!
    @IBOutlet weak var labelprofitAfterTax: UITextField!
    @IBOutlet weak var labelIncomeTax: UITextField!
    
    // Scroll de todas
    @IBOutlet weak var vcScrollView: UIScrollView!
    @IBOutlet weak var ThreeScrollView: UIScrollView!
    @IBOutlet weak var FiveScrollView: UIScrollView!
    @IBOutlet weak var SixScrollView: UIScrollView!
    @IBOutlet weak var EigthScrollView: UIScrollView!
    @IBOutlet weak var NineScrollView: UIScrollView!
    @IBOutlet weak var TenScrollView: UIScrollView!
    
    
    var formulasBrain = FormulasLogic();
    var formulasUtility = FormulasUtility();
    
    let transition = BubbleTransition();
    
    var resulTupla:Double = (0.0)
    
    // Formula Gratuita
     var sales: Double = 0.0
     var minCostSales: Double = 0.0
    
    // Formula 1 , 2
    var cost: Double = 0.0
    var margeNeto: Double = 0.0
    var opeExpenses: Double = 0.0
    
    // Formula 3
    var priceByUnity: Double = 0.0
    var breakeven: Double = 0.0
    
    // Formula 4
    var desiredUtily: Double = 0.0
    
    // Formula 5
    var royaltiesValue: Double = 0.0
    
    // Formula 6, 9
    var porcentDiscont: Double = 0.0
    var priceBefore: Double = 0.0
    var thresholdForDiscount: Double = 0.0
    var unityNewPrice: Double = 0.0
    var unityCost: Double = 0.0
    
    // Formula 7 
    typealias formulSeven = (
        personal:Double, uniform:Double, customersAwars:Double, tastings:Double, overtimeCharge:Double, aidTransport:Double, furnitureCost:Double,
        averageSalesByUnity:Double, averageGrossMargin:Double, priceUnityDiscount:Double, otherPrice:Double)
    
    var form: formulSeven = (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)
    var resulSend:(salesThresholdDiscount:Double, unityNewPrice:Double, unityCost:Double, averageSalesByUnity:Double, priceUnityDiscount:Double) = (0.0,0.0,0.0,0.0,0.0)
    
    // Formula 9
    typealias formulaNine = (levelRequiredSales:Double,costMerchandise:Double,grossMargin:Double,operatingCost:Double,netIncomeAofI:Double,financialExpenses:Double,
        netIncomeBeforeTax:Double,tax:Double,unityNet:Double,heritageExposed:Double, equityRequired:Double)
   
    var resulNineSend:formulaNine = (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)
    var forms:(annualExpenses:Double, taxPercentage:Double, annualFinancial:Double, heritageExposed:Double, requiredEquity:Double, averageGrossMargin:Double) = (0.0,0.0,0.0,0.0,0.0,0.0)
    
    // Formula 10 
    var porcentCost = Double()
    func userDidEnterData(data:String) {
        porcentCostoFinancial.text = data + "%"
        porcentCost = Double(data)!
    }
    var formTen:(annualExpenses:Double, averageGrossMargin:Double,profitAfterTax:Double,porcentCostoFinancial:Double,incomeTax:Double) = (0.0,0.0,0.0,0.0,0.0)
    var resulTen:(salesBudgetNetBeforeImp:Double,costMerchandise:Double,grossProfitSales:Double,operatingCost:Double,operationalUtility:Double,financialExpenses:Double,
    netIncomeBeforeImp:Double,incomeTaxes:Double,netIncomeAfterImp:Double) = (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (vcScrollView != nil)    { vcScrollView.contentSize.height = 1200 }
        if (ThreeScrollView != nil) { ThreeScrollView.contentSize.height = 667  }
        if (FiveScrollView != nil)  { FiveScrollView.contentSize.height = 650  }
        if (SixScrollView != nil)   { SixScrollView.contentSize.height = 720 }
        if (EigthScrollView != nil) { EigthScrollView.contentSize.height = 720 }
        if (NineScrollView != nil) { NineScrollView.contentSize.height = 800 }
        if (TenScrollView != nil) { TenScrollView.contentSize.height = 670 }

        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FormulaDetailViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    
    @IBAction func calculateFormulaFree(_ sender: UIButton) {
        if self.ProductTotalCost.text != "" &&  self.desiredRange.text != "" {
            let parsedCost = Double(self.ProductTotalCost.text!)!
            let desiredRangeParsed = Double(self.desiredRange.text!)!
            messageLabelError.alpha = 0.0
            if sender.currentTitle == "Calcular" || sender.currentTitle == "Calculate"  {
                let result = formulasBrain.saleWithDesiredRange(totalCost: parsedCost , desiredRange: desiredRangeParsed )
                resultFormula.text = formulasUtility.numberFormat(baseNumber: (result?.total)!)
            } else if sender.currentTitle == "Prueba" || sender.currentTitle == "Test" {
                let result = formulasBrain.saleWithDesiredRange(totalCost: parsedCost , desiredRange: desiredRangeParsed, type: "test" )
                sales = result!.total
                minCostSales = parsedCost
                performSegue(withIdentifier: "testFormulaZero", sender: Any?.self)
            }
        } else {
            ProductTotalCost.jitter(); desiredRange.jitter()
            messageLabelError.alpha = 1.0
        }
    }
    
    @IBAction func calculateFormulaOne(_ sender: UIButton) {
      if self.ProductTotalCost.text != "" && self.desiredRange.text != "" && self.operationalExpenses.text != "" {
        
        let parsedCost = Double(self.ProductTotalCost.text!)!
        let parsedRange = Double(self.desiredRange.text!)!
        let parsedExpense = Double(self.operationalExpenses.text!)!
        messageLabelError.alpha = 0.0
        
        if sender.currentTitle == "Calcular" || sender.currentTitle == "Calculate"   {
            let result = formulasBrain.saleWithDesiredRangeOperationExpenses(totalCost: parsedCost , desiredRange: parsedRange , operationalExpenses: parsedExpense)
            resultFormula.text = formulasUtility.numberFormat(baseNumber: result)
        } else if sender.currentTitle == "Prueba" || sender.currentTitle == "Test" {
            let result = formulasBrain.saleWithDesiredRangeOperationExpenses(totalCost: parsedCost , desiredRange: parsedRange , operationalExpenses: parsedExpense)
            cost = parsedCost
            sales = result
            margeNeto = parsedRange
            opeExpenses = parsedExpense
            performSegue(withIdentifier: "testFormulaOne", sender: Any?.self)
            }
       } else {
        ProductTotalCost.jitter(); desiredRange.jitter(); operationalExpenses.jitter()
        messageLabelError.alpha = 1.0
        }
    }
    
    @IBAction func calculateFormulaTwo(_ sender: AnyObject) {
        
      if self.operationalExpenses.text != "" && self.averageGrossMargin.text != "" {
        let parsedExpense = Double(self.operationalExpenses.text!)!
        let parsedAverageGrossMargin = Double(self.averageGrossMargin.text!)!
        messageLabelError.alpha = 0.0
        
        if sender.currentTitle == "Calcular" || sender.currentTitle == "Calculate"  {
            let result = formulasBrain.breakevenByValue(totalExpenses: parsedExpense, averageGrossMargin: parsedAverageGrossMargin)
            resultFormula.text = formulasUtility.numberFormat(baseNumber: result)
        } else if sender.currentTitle == "Prueba" || sender.currentTitle == "Test"  {
            let result = formulasBrain.breakevenByValue(totalExpenses: parsedExpense, averageGrossMargin: parsedAverageGrossMargin)
            sales = result
            cost = parsedExpense
            margeNeto = parsedAverageGrossMargin
            performSegue(withIdentifier: "testFormulaTwo", sender: Any?.self)
        }
      } else {
        averageGrossMargin.jitter(); operationalExpenses.jitter() ; averageGrossMargin.jitter()
        messageLabelError.alpha = 1.0
        }
    }
    
    @IBAction func calculateFormulaThree(_ sender: AnyObject) {
        
        if operationalExpenses.text != "" && averageGrossMargin.text != "" && priceByUnit.text != "" {
            
        let parsedExpense = Double(self.operationalExpenses.text!)!
        let parsedAverageGrossMargin = Double(self.averageGrossMargin.text!)!
        let parsedpriceByUnit = Double(self.priceByUnit.text!)!
        mesageLabelError.alpha = 0.0
            
        if sender.currentTitle == "Calcular" || sender.currentTitle == "Calculate"   {
            let result = formulasBrain.breakevenByUnit(totalExpenses: parsedExpense, averageGrossMargin: parsedAverageGrossMargin, unitAvaragePrice: parsedpriceByUnit)
            resultFormula.text = formulasUtility.numberFormat(baseNumber: result.breakeven)
            secondFormulaResult.text = String(result.breakevenUnit)
            
        } else if sender.currentTitle == "Prueba" || sender.currentTitle == "Test" {
            let result = formulasBrain.breakevenByUnit(totalExpenses: parsedExpense, averageGrossMargin: parsedAverageGrossMargin, unitAvaragePrice: parsedpriceByUnit)
            sales = result.breakeven
            cost = parsedExpense
            margeNeto = parsedAverageGrossMargin
            priceByUnity = parsedpriceByUnit
            breakeven = Double(result.breakevenUnit)
            performSegue(withIdentifier: "testFormulaThree", sender: Any?.self)
        }
     } else {
            operationalExpenses.jitter(); averageGrossMargin.jitter(); priceByUnit.jitter()
            mesageLabelError.alpha = 1.0
        }
    }
    
    
    @IBAction func calculateFormulaFour(_ sender: AnyObject) {
    if operationalExpenses.text != "" && averageGrossMargin.text != "" && desiredUtility.text != "" {
        let parsedExpense = Double(self.operationalExpenses.text!)!
        let parsedAverageGrossMargin = Double(self.averageGrossMargin.text!)!
        let parsedDesiredUtility = Double(self.desiredUtility.text!)!
        messageLabelError.alpha = 0.0
        if sender.currentTitle == "Calcular" || sender.currentTitle == "Calculate"   {
            let result = formulasBrain.salesWithUtility(totalExpenses: parsedExpense, averageGrossMargin: parsedAverageGrossMargin, saleUtilityDesired: parsedDesiredUtility)
            resultFormula.text = formulasUtility.numberFormat(baseNumber: result)
        } else if sender.currentTitle == "Prueba" || sender.currentTitle == "Test"  {
            let result = formulasBrain.salesWithUtility(totalExpenses: parsedExpense, averageGrossMargin: parsedAverageGrossMargin, saleUtilityDesired: parsedDesiredUtility)
            sales = result
            cost = parsedExpense
            margeNeto = parsedAverageGrossMargin
            desiredUtily = parsedDesiredUtility
            performSegue(withIdentifier: "testFormulaFour", sender: Any?.self)
        }
    } else {
        operationalExpenses.jitter(); averageGrossMargin.jitter() ; desiredUtility.jitter()
        messageLabelError.alpha = 1.0
        }
        
    }
    
    @IBAction func calculateFormulaFive(_ sender: AnyObject) {
      if operationalExpenses.text != "" && averageGrossMargin.text != "" && desiredUtility.text != "" && valueRoyalties.text != "" {
        let parsedExpense = Double(self.operationalExpenses.text!)!
        let parsedAverageGrossMargin = Double(self.averageGrossMargin.text!)!
        let parsedDesiredUtility = Double(self.desiredUtility.text!)!
        let parsedRoyaltiesValue = Double(self.valueRoyalties.text!)!
        messageLabelError.alpha = 0.0
        if sender.currentTitle == "Calcular" || sender.currentTitle == "Calculate"    {
            let result = formulasBrain.salesWithUtilityPayingRoyalties(totalExpenses: parsedExpense, averageGrossMargin: parsedAverageGrossMargin, saleUtilityDesired: parsedDesiredUtility, royaltiesValue: parsedRoyaltiesValue)
            resultFormula.text = formulasUtility.numberFormat(baseNumber: result)

        } else if sender.currentTitle == "Prueba" || sender.currentTitle == "Test" {
            let result = formulasBrain.salesWithUtilityPayingRoyalties(totalExpenses: parsedExpense, averageGrossMargin: parsedAverageGrossMargin, saleUtilityDesired: parsedDesiredUtility, royaltiesValue: parsedRoyaltiesValue)
            sales = result
            cost = parsedExpense
            margeNeto = parsedAverageGrossMargin
            desiredUtily = parsedDesiredUtility
            royaltiesValue = parsedRoyaltiesValue
            performSegue(withIdentifier: "testFormulaFive", sender: Any?.self)
        }
      } else {
        operationalExpenses.jitter(); averageGrossMargin.jitter(); desiredUtility.jitter(); valueRoyalties.jitter()
        messageLabelError.alpha = 1.0
    }
  }
    
    @IBAction func calculateFormulaSix(_ sender: AnyObject) {
     if averageGrossMargin.text != "" && averageSalesByUnity.text != "" && discountPercentage.text != "" && unityPricePreDiscount.text != "" {
        let parsedUnitySales = Double(self.averageSalesByUnity.text!)!
        let parsedAverageGrossMargin = Double(self.averageGrossMargin.text!)!
        let discountPercent = Double(self.discountPercentage.text!)!
        let unityPricePreDiscount = Double(self.unityPricePreDiscount.text!)!
        messageLabelError.alpha = 0.0
        if sender.currentTitle == "Calcular" || sender.currentTitle == "Calculate"   {
            let result = formulasBrain.salesThresholdForADiscount(averageSalesByUnity: parsedUnitySales, averageGrossMargin: parsedAverageGrossMargin, discountPercentage: discountPercent, unityPricePreDiscount: unityPricePreDiscount)
        
            resultFormula.text = formulasUtility.numberFormat(baseNumber: result.thresholdForDiscount)
            secondFormulaResult.text = formulasUtility.numberFormat(baseNumber: result.unityNewPrice)
            thirdFormulaResult.text = formulasUtility.numberFormat(baseNumber: result.unityCost)
        
        } else if  sender.currentTitle == "Prueba" || sender.currentTitle == "Test" {
            let result = formulasBrain.salesThresholdForADiscount(averageSalesByUnity: parsedUnitySales, averageGrossMargin: parsedAverageGrossMargin, discountPercentage: discountPercent, unityPricePreDiscount: unityPricePreDiscount)
            cost = parsedUnitySales
            margeNeto = parsedAverageGrossMargin
            porcentDiscont = discountPercent
            priceBefore = unityPricePreDiscount
            thresholdForDiscount =  result.thresholdForDiscount
            unityNewPrice = result.unityNewPrice
            unityCost = result.unityCost
            performSegue(withIdentifier: "testFormulaSix", sender: Any?.self)
        }
     } else {
        averageGrossMargin.jitter(); averageSalesByUnity.jitter(); discountPercentage.jitter(); unityPricePreDiscount.jitter()
        messageLabelError.alpha = 1.0
    }
    }

    @IBAction func calculateFormulaSeven(_ sender: AnyObject) {
        if averageSalesByUnity.text != "" && averageGrossMargin.text != "" && actPricebyUnityDiscount.text != "" {
        form.averageSalesByUnity = averageSalesByUnity.text != "" ? Double(self.averageSalesByUnity.text!)! : 0.0
        form.averageGrossMargin = averageGrossMargin.text != "" ? Double(self.averageGrossMargin.text!)! : 0.0
        form.personal = actPersonal.text != "" ? Double(self.actPersonal.text!)! : 0.0
        form.uniform = actUniform.text != "" ? Double(self.actUniform.text!)! : 0.0
        form.aidTransport = actAidTransport.text != "" ? Double(self.actAidTransport.text!)!  : 0.0
        form.customersAwars = actCustomerAwars.text != "" ? Double(self.actCustomerAwars.text!)! : 0.0
        form.tastings = actTastings.text != "" ? Double(self.actTastings.text!)! : 0.0
        form.overtimeCharge = actTastings.text != "" ? Double(self.actoverTimeCharge.text!)! : 0.0
        form.furnitureCost = actFurnitureCost.text != "" ? Double(self.actFurnitureCost.text!)! : 0.0
        form.otherPrice = actOther.text != "" ? Double(self.actOther.text!)! : 0.0
        form.priceUnityDiscount = Double(self.actPricebyUnityDiscount.text!)!
        messageLabelError.alpha = 0.0
        if sender.currentTitle == "Calcular" || sender.currentTitle == "Calculate"   {
            let result = formulasBrain.activityTradeMarketing(
                personal: form.personal,
                uniform: form.uniform,
                customersAwars: form.customersAwars,
                tastings: form.tastings,
                overtimeCharge: form.overtimeCharge,
                aidTransport: form.aidTransport,
                furnitureCost: form.furnitureCost,
                averageSalesByUnity: form.averageSalesByUnity,
                averageGrossMargin: form.averageGrossMargin,
                priceUnityDiscount: form.priceUnityDiscount,
                otherPrice: form.otherPrice)
            
            subtotalAct.text = formulasUtility.numberFormat(baseNumber: result.activitiTradeResult)
            resultFormula.text = formulasUtility.numberFormat(baseNumber: result.salesThresholdForMarketing)
            secondFormulaResult.text = formulasUtility.numberFormat(baseNumber: result.newSalesThresholdForMarketing)
            thirdFormulaResult.text = String(result.percentageForMoney)
            fourFormulaResul.text = formulasUtility.numberFormat(baseNumber: result.salesThresholdDiscount)
            newCostFormulaResult.text = formulasUtility.numberFormat(baseNumber: result.unityNewPrice)
            costFormulaResult.text = formulasUtility.numberFormat(baseNumber: result.unityCost)
        } else if sender.currentTitle == "Prueba" || sender.currentTitle == "Test"  {
            let result = formulasBrain.activityTradeMarketing(
                personal: form.personal,
                uniform: form.uniform,
                customersAwars: form.customersAwars,
                tastings: form.tastings,
                overtimeCharge: form.overtimeCharge,
                aidTransport: form.aidTransport,
                furnitureCost: form.furnitureCost,
                averageSalesByUnity: form.averageSalesByUnity,
                averageGrossMargin: form.averageGrossMargin,
                priceUnityDiscount: form.priceUnityDiscount,
                otherPrice: form.otherPrice)
            
            resulSend = (result.salesThresholdDiscount, result.unityNewPrice, result.unityCost, form.averageSalesByUnity, form.priceUnityDiscount)
            performSegue(withIdentifier: "testFormulaSeven", sender: Any?.self)

        }
        } else {
            averageGrossMargin.jitter();averageSalesByUnity.jitter() ; actPricebyUnityDiscount.jitter()
            messageLabelError.alpha = 1.0
        }
    }
    
    @IBAction func calculateFormulaEight(_ sender: AnyObject) {
        if averageSalesByUnity.text != "" && averageGrossMargin.text != "" && discountPercentage.text != "" && unityPricePreDiscount.text != "" {
        let parsedUnitySales = Double(self.averageSalesByUnity.text!)!
        let parsedAverageGrossMargin = Double(self.averageGrossMargin.text!)!
        let discountPercent = Double(self.discountPercentage.text!)!
        let unityPricePreDiscount = Double(self.unityPricePreDiscount.text!)!
        messageLabelError.alpha = 0.0
            
        if sender.currentTitle == "Calcular" || sender.currentTitle == "Calculate"   {
            let result = formulasBrain.salesThresholdMinUpPrice(averageSalesByUnity: parsedUnitySales, averageGrossMargin: parsedAverageGrossMargin, discountPercentage: discountPercent, unityPricePreDiscount: unityPricePreDiscount)
            
            resultFormula.text = formulasUtility.numberFormat(baseNumber: result.thresholdForDiscount)
            secondFormulaResult.text = formulasUtility.numberFormat(baseNumber: result.unityNewPrice)
            thirdFormulaResult.text = formulasUtility.numberFormat(baseNumber: result.unityCost)
            
        } else if  sender.currentTitle == "Prueba" || sender.currentTitle == "Test" {
            let result = formulasBrain.salesThresholdMinUpPrice(averageSalesByUnity: parsedUnitySales, averageGrossMargin: parsedAverageGrossMargin, discountPercentage: discountPercent, unityPricePreDiscount: unityPricePreDiscount)
            cost = parsedUnitySales
            margeNeto = parsedAverageGrossMargin
            porcentDiscont = discountPercent
            priceBefore = unityPricePreDiscount
            thresholdForDiscount =  result.thresholdForDiscount
            unityNewPrice = result.unityNewPrice
            unityCost = result.unityCost
            performSegue(withIdentifier: "testFormulaEight", sender: Any?.self)
        }
        } else {
            averageGrossMargin.jitter(); averageSalesByUnity.jitter(); discountPercentage.jitter(); unityPricePreDiscount.jitter()
            messageLabelError.alpha = 1.0
        }
    }
    
    @IBAction func calculateFormulaNine(_ sender: AnyObject) {
        if annualExpenses.text != "" && taxPercentage.text != "" && annualFinancial.text != "" && heritageExposed.text != "" && requiredEquity.text != "" && averageGrossMargin.text != "" {
        forms.annualExpenses =  Double(self.annualExpenses.text!)!
        forms.taxPercentage = Double(self.taxPercentage.text!)!
        forms.annualFinancial = Double(self.annualFinancial.text!)!
        forms.heritageExposed = Double(self.heritageExposed.text!)!
        forms.requiredEquity = Double(self.requiredEquity.text!)!
        forms.averageGrossMargin = Double(self.averageGrossMargin.text!)!
        messageLabelError.alpha = 0.0
            
         if sender.currentTitle == "Calcular" || sender.currentTitle == "Calculate"   {
            let result = formulasBrain.annualSalesBudget(annualExpenses: forms.annualExpenses, taxPercentage: forms.taxPercentage, annualFinancial: forms.annualFinancial, heritageExposed: forms.heritageExposed, requiredEquity: forms.requiredEquity, averageGrossMargin: forms.averageGrossMargin)
            levelRequiredSales.text = formulasUtility.numberFormat(baseNumber: result.levelRequiredSales)
         } else if  sender.currentTitle == "Prueba" || sender.currentTitle == "Test"  {
            let result = formulasBrain.annualSalesBudget(annualExpenses: forms.annualExpenses, taxPercentage: forms.taxPercentage, annualFinancial: forms.annualFinancial, heritageExposed: forms.heritageExposed, requiredEquity: forms.requiredEquity, averageGrossMargin: forms.averageGrossMargin)
            resulNineSend = result
            performSegue(withIdentifier: "testFormulaNine", sender: Any?.self)
        }
        } else {
            annualExpenses.jitter(); taxPercentage.jitter(); annualFinancial.jitter(); heritageExposed.jitter(); requiredEquity.jitter(); averageGrossMargin.jitter()
            messageLabelError.alpha = 1.0
        }
    }
   
    @IBAction func calculateFormulaTen(_ sender: AnyObject) {
        if annualExpenses.text != "" && averageGrossMargin.text != "" && labelprofitAfterTax.text != "" && porcentCostoFinancial.text != nil && labelIncomeTax.text != "" {
        formTen.annualExpenses = Double(self.annualExpenses.text!)!
        formTen.averageGrossMargin = Double(self.averageGrossMargin.text!)!
        formTen.profitAfterTax =    Double(self.labelprofitAfterTax.text!)!
        formTen.porcentCostoFinancial = Double(self.porcentCost)
        formTen.incomeTax = Double(self.labelIncomeTax.text!)!
        messageLabelError.alpha = 0.0
        
        if sender.currentTitle == "Calcular" || sender.currentTitle == "Calculate"   {
            let result = formulasBrain.salesBudgetAnnualExpenses(annualExpenses: formTen.annualExpenses, averageGrossMargin: formTen.averageGrossMargin, profitAfterTax: formTen.profitAfterTax, porcentCostoFinancial: formTen.porcentCostoFinancial, incomeTax: formTen.incomeTax)
            resultFormula.text = formulasUtility.numberFormat(baseNumber: result.salesBudgetNetBeforeImp)
        } else if  sender.currentTitle == "Prueba" || sender.currentTitle == "Test" {
            let result = formulasBrain.salesBudgetAnnualExpenses(annualExpenses: formTen.annualExpenses, averageGrossMargin: formTen.averageGrossMargin, profitAfterTax: formTen.profitAfterTax, porcentCostoFinancial: formTen.porcentCostoFinancial, incomeTax: formTen.incomeTax)
            resulTen = result
            performSegue(withIdentifier: "testFormulaTen", sender: Any?.self)
        }
            
        } else {
            annualExpenses.jitter(); averageGrossMargin.jitter(); labelprofitAfterTax.jitter(); porcentCostoFinancial.jitter(); labelIncomeTax.jitter()
            messageLabelError.alpha = 1.0
        }
    }
    
    
    /* TODO: NO Funciona!!!, PELIGRO DE ESTRESS */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "testFormulaZero" {
            if let sendDataView = segue.destination as? ModalViewController {
                sendDataView.tipoPrueba = "Prueba_venta_deseada"
                sendDataView.sales = sales
                sendDataView.minCostSales = minCostSales
                sendDataView.transitioningDelegate = self
                sendDataView.modalPresentationStyle = .custom
            }
        }
        
        if segue.identifier == "testFormulaOne" {
            if let sendDataView = segue.destination as? ModalViewController {
                sendDataView.tipoPrueba = "Prueba_porcentaje_margen"
                sendDataView.sales = sales
                sendDataView.cost = cost
                sendDataView.margeNeto = margeNeto
                sendDataView.opeExpenses = opeExpenses
                sendDataView.transitioningDelegate = self
                sendDataView.modalPresentationStyle = .custom
            }
        }
        if segue.identifier == "testFormulaTwo" {
            if let sendDataView = segue.destination as? ModalViewController {
                sendDataView.tipoPrueba = "Punto_equilibrio_dinero"
                sendDataView.sales = sales
                sendDataView.cost = cost
                sendDataView.margeNeto = margeNeto
                sendDataView.transitioningDelegate = self
                sendDataView.modalPresentationStyle = .custom
            }
        }
        if segue.identifier == "testFormulaThree" {
            if let sendDataView = segue.destination as? ModalViewController {
                sendDataView.tipoPrueba = "Punto_equilibrio_unidades"
                sendDataView.sales = sales
                sendDataView.cost = cost
                sendDataView.margeNeto = margeNeto
                sendDataView.priceByUnity = priceByUnity
                sendDataView.breakeven = breakeven
                sendDataView.transitioningDelegate = self
                sendDataView.modalPresentationStyle = .custom
            }
        }
        if segue.identifier == "testFormulaFour" {
            if let sendDataView = segue.destination as? ModalViewController {
                sendDataView.tipoPrueba = "Ventas_nivel_gasto"
                sendDataView.sales = sales
                sendDataView.cost = cost
                sendDataView.margeNeto = margeNeto
                sendDataView.desiredUtily = desiredUtily
                sendDataView.transitioningDelegate = self
                sendDataView.modalPresentationStyle = .custom
            }
        }
        
        if segue.identifier == "testFormulaFive" {
            if let sendDataView = segue.destination as? ModalViewController {
                sendDataView.tipoPrueba = "Ventas_minimas_gasto_mensuales"
                sendDataView.sales = sales
                sendDataView.cost = cost
                sendDataView.margeNeto = margeNeto
                sendDataView.royaltiesValue = royaltiesValue
                sendDataView.desiredUtily = desiredUtily
                sendDataView.transitioningDelegate = self
                sendDataView.modalPresentationStyle = .custom
            }
        }
        if segue.identifier == "testFormulaSix" {
            if let sendDataView = segue.destination as? ModalViewController {
                sendDataView.tipoPrueba = "Umbral_minimo_de_ventas"
                sendDataView.cost = cost
                sendDataView.margeNeto = margeNeto
                sendDataView.priceBefore = priceBefore
                sendDataView.porcentDiscont = porcentDiscont
                sendDataView.thresholdForDiscount = thresholdForDiscount
                sendDataView.unityNewPrice = unityNewPrice
                sendDataView.unityCost = unityCost
                sendDataView.transitioningDelegate = self
                sendDataView.modalPresentationStyle = .custom
            }
        }
        if segue.identifier == "testFormulaSeven" {
            if let sendDataView = segue.destination as? ModalViewController {
                sendDataView.tipoPrueba = "Umbral_incremento_de_actividad"
                sendDataView.resulSend = resulSend
                sendDataView.transitioningDelegate = self
                sendDataView.modalPresentationStyle = .custom
            }
        }
        if segue.identifier == "testFormulaEight" {
            if let sendDataView = segue.destination as? ModalViewController {
                sendDataView.tipoPrueba = "Umbral_minimo_de_ventas"
                sendDataView.cost = cost
                sendDataView.margeNeto = margeNeto
                sendDataView.priceBefore = priceBefore
                sendDataView.porcentDiscont = porcentDiscont
                sendDataView.thresholdForDiscount = thresholdForDiscount
                sendDataView.unityNewPrice = unityNewPrice
                sendDataView.unityCost = unityCost
                sendDataView.transitioningDelegate = self
                sendDataView.modalPresentationStyle = .custom
            }
        }
        if segue.identifier == "testFormulaNine" {
            if let sendDataView = segue.destination as? ModalViewController {
                sendDataView.tipoPrueba = "Presupuesto_Anual_de_ventas"
                sendDataView.formulaNine = resulNineSend
                sendDataView.transitioningDelegate = self
                sendDataView.modalPresentationStyle = .custom
            }
        }
        
        if segue.identifier == "dataFromPorcentual" {
            let sendView = segue.destination as? PorcentalTableViewController
            sendView?.delegate = self
        }
        
        if segue.identifier == "testFormulaTen" {
            if let sendDataView = segue.destination as? ModalViewController {
                sendDataView.tipoPrueba = "Presupuesto_Anual_de_ventas_con_Gastos_Anuales"
                sendDataView.resulTen = resulTen
                sendDataView.transitioningDelegate = self
                sendDataView.modalPresentationStyle = .custom
            }
        }

    }
    
    
     // Para animar el modal
    // MARK: UIViewControllerTransitioningDelegate
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = transitionButon.center
        transition.bubbleColor = transitionButon.backgroundColor!
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = transitionButon.center
        transition.bubbleColor = transitionButon.backgroundColor!
        return transition
    }

}
