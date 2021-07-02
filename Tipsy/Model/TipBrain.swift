//
//  TipBrain.swift
//  Tipsy
//
//  Created by Binaya on 20/05/2021.
//

import Foundation

struct TipBrain {
    
    var tip: Tip?
    
    mutating func getTipPerPersonWith(_ totalBill: Double, _ tipPercent: Double, _ noOfPpl: Double) {
        
        if tipPercent == 0.0 {
            let tipValue = String(format: "%.2f", totalBill / noOfPpl)
            let noOfPplInString = String(format: "%.0f", noOfPpl)
            let message = "Split between \(noOfPplInString) people, with 0% tip."
            tip = Tip(tipPerPerson: tipValue, message: message)
        }else {
            let billWithPercent = totalBill + totalBill * tipPercent
            let tipValue = String(format: "%.2f", billWithPercent / noOfPpl)
            let noOfPplInString = String(format: "%.0f", noOfPpl)
            let percentageInString = String(format: "%.0f", tipPercent * 100)
            let message = "Split between \(noOfPplInString) people, with \(percentageInString)% tip."
            tip = Tip(tipPerPerson: tipValue, message: message)
        }
        
    }
    
    func getTip() -> String {
        return tip?.tipPerPerson ?? "0.0"
    }
    
    func getMessage() -> String {
        return tip?.message ?? "Error"
    }
    
}
