//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true //default start up app is true
    //private means only accessible in this class. Other class cannot access this variable even if you instantiate an object of the class.
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic() //the number is now stored inside this calculator object created from calculatorlogic
    //a good tip is to set all the global variable to be private so that other classes cannot access or unintentionally changed it.
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        
        isFinishedTypingNumber = true // becuz if you are not finish typing, this value is false. Once you pressed this button, then you have finished typing.
        
        calculator.setNumber(displayValue)

        
        if let calcMethod = sender.currentTitle {
            
            if let result = calculator.calculate(symbol: calcMethod) { //to unwrap the optional output from the function calculate
                displayValue = result
            }
            
        }
        
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        // cmd + opt + <- will hide the line of codes underneath the above line indendation.
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue //set to the number on the button if the currentTitle is not nil
                isFinishedTypingNumber = false //because you are not done with typing number
            } else {
                
                if numValue == "." {
                    
                    let isInt = (floor(displayValue) == displayValue)
                    if !isInt { //if is not an int after flooring the number
                        return //forces our function to exit this method.
                    }
                }
                
                displayLabel.text = displayLabel.text! + numValue //append the value to what is currently display on the displayLabel
            }
            
        }
        
    
    }

}

