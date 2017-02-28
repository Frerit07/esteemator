//
//  FormulasLogic.swift
//  esteemator
//
//  Created by Kevin Gómez on 27/09/16.
//  Copyright © 2016 Strategee. All rights reserved.
//
import Foundation

class FormulasLogic {
    
    /* Formula free */
    func saleWithDesiredRange(totalCost: Double, desiredRange: Double, type:String?=nil) -> (total:Double, range:Double)? {
        var range:Double = 0.0
        let margenFormatted: Double = 1 - Double(desiredRange) / 100
        let result:Double = Double(totalCost) / margenFormatted
         if type == "test" {
            range = result - totalCost
            return (result, Double(range))
        }
        return (result, range)
    }

    /* Formula one */
    func saleWithDesiredRangeOperationExpenses(totalCost: Double, desiredRange: Double, operationalExpenses: Double, type:String?=nil) -> (Double) {
        let deductionFormatted: Double = 1 - (Double(desiredRange) / 100) - (Double(operationalExpenses) / 100)
        let result:Double = Double(totalCost) / deductionFormatted
        return result
    }
    
    /* Formula two */
    func breakevenByValue(totalExpenses: Double, averageGrossMargin: Double) -> Double {
        let breakeven_value = totalExpenses / (Double(averageGrossMargin) / 100)
        
        return breakeven_value
    }
    /* Formula three */
    func breakevenByUnit(totalExpenses: Double, averageGrossMargin: Double, unitAvaragePrice: Double) -> (breakeven: Double, breakevenUnit: Int) {
        let breakeven = breakevenByValue(totalExpenses: totalExpenses, averageGrossMargin: averageGrossMargin)
        let breakevenUnitTotal =  breakeven / unitAvaragePrice
        
        return ( breakeven, Int(breakevenUnitTotal))
        
    }
    
    /*Formula Four*/
    
    func salesWithUtility(totalExpenses: Double, averageGrossMargin: Double, saleUtilityDesired: Double) -> Double {
        
        let budgetedPercentage = (averageGrossMargin / 100) - (saleUtilityDesired / 100)
        let budgetedSales = totalExpenses / budgetedPercentage
        
        return budgetedSales
    }
    
    /*Formula Five*/
    
    func salesWithUtilityPayingRoyalties(totalExpenses: Double, averageGrossMargin: Double, saleUtilityDesired:Double, royaltiesValue: Double) -> Double {
        
        let budgetedPercentage = (averageGrossMargin / 100) - (saleUtilityDesired / 100) - (royaltiesValue / 100)
        
        let budgetedSalesRoyalties = totalExpenses / budgetedPercentage

        return budgetedSalesRoyalties
    }
    
    /* Formula Six */
    func salesThresholdForADiscount(averageSalesByUnity: Double, averageGrossMargin: Double, discountPercentage: Double, unityPricePreDiscount: Double) -> (thresholdForDiscount: Double, unityNewPrice: Double, unityCost: Double) {
        
        var tempValue = (discountPercentage / 100) / ((averageGrossMargin / 100) - (discountPercentage / 100))
        tempValue = tempValue * 1
        tempValue = tempValue * averageSalesByUnity
        
        let thresholdForDiscount = tempValue + averageSalesByUnity
        
        var unityNewPrice = 1 - (discountPercentage / 100)
        unityNewPrice = unityPricePreDiscount * unityNewPrice
        
        var unityCost =  1 - (averageGrossMargin / 100)
        unityCost = unityPricePreDiscount * unityCost
        
        return(thresholdForDiscount, unityNewPrice, unityCost)
        
    }
    
    /* Formula Seven */
    

    func activityTradeMarketing(
        personal:Double, uniform:Double, customersAwars:Double, tastings:Double, overtimeCharge:Double, aidTransport:Double, furnitureCost:Double,
        averageSalesByUnity:Double, averageGrossMargin:Double, priceUnityDiscount:Double, otherPrice:Double, type:String?=nil)
        
        -> (activitiTradeResult:Double,
            salesThresholdForMarketing:Double,
            newSalesThresholdForMarketing:Double,
            percentageForMoney:Double,
            salesThresholdDiscount:Double,
            unityNewPrice:Double,
            unityCost:Double)
    {
        
        let activitiTradeResult = personal + uniform + customersAwars + tastings + overtimeCharge + aidTransport + furnitureCost + otherPrice
            
        let salesThresholdForMarketing = averageSalesByUnity * priceUnityDiscount
        
        let newSalesThresholdForMarketing = salesThresholdForMarketing - activitiTradeResult
        
        var percentageForMoney = activitiTradeResult / salesThresholdForMarketing
        percentageForMoney = percentageForMoney * 100
            
        var salesThresholdDiscount = (percentageForMoney/100) / ((averageGrossMargin/100) - (percentageForMoney/100))
        salesThresholdDiscount = (salesThresholdDiscount * 1) * averageSalesByUnity
        salesThresholdDiscount = salesThresholdDiscount + averageSalesByUnity
            
        var unityNewPrice = 1 - percentageForMoney / 100
        unityNewPrice = priceUnityDiscount * unityNewPrice
            
        var unityCost =  1 - (averageGrossMargin / 100)
        unityCost = priceUnityDiscount * unityCost

        return (activitiTradeResult, salesThresholdForMarketing, newSalesThresholdForMarketing, percentageForMoney, salesThresholdDiscount, unityNewPrice, unityCost)
    }
    
    // Formula Eight
    func salesThresholdMinUpPrice(averageSalesByUnity: Double, averageGrossMargin: Double, discountPercentage: Double, unityPricePreDiscount: Double) -> (thresholdForDiscount: Double, unityNewPrice: Double, unityCost: Double) {
        
        var tempValue = (discountPercentage / 100) / ((averageGrossMargin / 100) + (discountPercentage / 100))
        tempValue = tempValue * 1
        tempValue = tempValue * averageSalesByUnity
        
        let thresholdForDiscount = averageSalesByUnity - tempValue
        
        var unityNewPrice = 1 + (discountPercentage / 100)
        unityNewPrice = unityPricePreDiscount * unityNewPrice
        
        var unityCost =  1 - (averageGrossMargin / 100)
        unityCost = unityPricePreDiscount * unityCost
        
        return(thresholdForDiscount, unityNewPrice, unityCost)
        
    }
    
    // Formula Nine
    func annualSalesBudget(annualExpenses:Double, taxPercentage:Double, annualFinancial:Double, heritageExposed:Double, requiredEquity:Double, averageGrossMargin:Double)
        -> (levelRequiredSales:Double,costMerchandise:Double,grossMargin:Double,operatingCost:Double,netIncomeAofI:Double,financialExpenses:Double,
        netIncomeBeforeTax:Double,tax:Double,unityNet:Double,heritageExposed:Double, equityRequired:Double ) {
           
            var levelRequiredSales = heritageExposed  * (requiredEquity / 100)
            levelRequiredSales = levelRequiredSales / (1 - taxPercentage / 100)
            levelRequiredSales = (annualFinancial + annualExpenses) + levelRequiredSales
            levelRequiredSales = levelRequiredSales / (averageGrossMargin / 100)
            
            var costMerchandise =   1 - (averageGrossMargin / 100)
            costMerchandise = levelRequiredSales * costMerchandise
            
            let grossMargin = levelRequiredSales - costMerchandise
            let operatingCost = annualExpenses
            let netIncomeAofI = grossMargin - operatingCost
            let financialExpenses = annualFinancial
            let netIncomeBeforeTax = netIncomeAofI - financialExpenses
            let tax = netIncomeBeforeTax  * (taxPercentage / 100 )
            let unityNet = netIncomeBeforeTax - tax
            let equityRequired = heritageExposed * (requiredEquity / 100)
            
            return (levelRequiredSales, costMerchandise, grossMargin,operatingCost, netIncomeAofI, financialExpenses, netIncomeBeforeTax, tax, unityNet, heritageExposed, equityRequired)
        
    }
    
    
    // Funcion Ten

    func salesBudgetAnnualExpenses(annualExpenses:Double, averageGrossMargin:Double, profitAfterTax:Double, porcentCostoFinancial:Double, incomeTax:Double )
        -> (salesBudgetNetBeforeImp:Double,costMerchandise:Double,grossProfitSales:Double,operatingCost:Double,operationalUtility:Double,financialExpenses:Double,
        netIncomeBeforeImp:Double,incomeTaxes:Double,netIncomeAfterImp:Double) {
            
            var salesBudgetNetBeforeImp = (profitAfterTax / 100) / ( 1 - (porcentCostoFinancial / 100))
            salesBudgetNetBeforeImp =  salesBudgetNetBeforeImp / (1 - (incomeTax / 100))
            salesBudgetNetBeforeImp = (averageGrossMargin / 100)  - salesBudgetNetBeforeImp
            salesBudgetNetBeforeImp = annualExpenses / salesBudgetNetBeforeImp
            
            let costMerchandise = salesBudgetNetBeforeImp * (1 - (averageGrossMargin / 100))
            let grossProfitSales = salesBudgetNetBeforeImp - costMerchandise
            let operatingCost = annualExpenses
            let operationalUtility =  grossProfitSales - operatingCost
            let financialExpenses = operationalUtility * (porcentCostoFinancial / 100)
            let netIncomeBeforeImp = operationalUtility - financialExpenses
            let incomeTaxes = netIncomeBeforeImp * (incomeTax / 100)
            let netIncomeAfterImp = netIncomeBeforeImp - incomeTaxes
            
            
            return (salesBudgetNetBeforeImp, costMerchandise,grossProfitSales,operatingCost, operationalUtility,financialExpenses,netIncomeBeforeImp, incomeTaxes, netIncomeAfterImp )
            
    }
    
    
}
