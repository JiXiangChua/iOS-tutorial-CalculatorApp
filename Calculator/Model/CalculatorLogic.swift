//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by JI XIANG on 30/7/21.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (number1: Double, calcMethod: String)? //so that we can init without passing in anything
    
    mutating func setNumber(_ number: Double) { //setting the external parameter name to be nothing, and the internal parameter name is number so that we can use it inside our code
        self.number = number //becuz you are changing one of the property inside this struct, therefore we have to mark the function mutating
        
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n / 100
            case "=":
                return performTwoNumCalculation(number2: n)
            default: //for + - * /
                intermediateCalculation = (number1: n, calcMethod: symbol) //storing the number and operation as tuple
            }
        }
        return nil //if cant match the signs, then we return nil. And thefore this function output is an optional Double
    }
    
    private func performTwoNumCalculation(number2: Double) -> Double? { //becuz only this struct will use this method, thats why we marked private
        if let n1 = intermediateCalculation?.number1, let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + number2
            case "-":
                return n1 - number2
            case "×":
                return n1 * number2
            case "÷":
                return n1 / number2
            default:
                fatalError("The operation passed in does not match any of the cases. ")
            }
        }
        
        return nil //nothing to perform if there is no two numbers.
    }
    
}
