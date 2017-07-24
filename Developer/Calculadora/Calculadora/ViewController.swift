//
//  ViewController.swift
//  Calculadora
//
//  Created by retina on 01/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    @IBOutlet weak var historicoOperacoes: UITextView!
    
    private var userIsInTheMiddleOfTyping = false
    private var brain = BrainCalculadora()
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if self.userIsInTheMiddleOfTyping {
            let textCurrentInDisplay = display.text!
            self.display.text = textCurrentInDisplay + digit
        } else {
            self.display.text = digit
            self.userIsInTheMiddleOfTyping = true
        }
    }
    
    var displayValue : Double {
        get {
            return Double(display.text!)!
        }
        
        set {
            self.display.text = String(newValue)
        }
    }
    
    var displayHistory : String {
        get {
            return self.historicoOperacoes.text
        }
        set {
            self.historicoOperacoes.text = String(newValue)
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        if self.userIsInTheMiddleOfTyping {
            brain.setOperator(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let operation = sender.currentTitle {
            brain.performOperation(operation)
        }
        
        if let result = brain.result {
            displayValue = result
            displayHistory = brain.history!
        }
    }
    
    
    @IBAction func performClear(_ sender: UIButton) {
        self.display.text = "0"
        self.userIsInTheMiddleOfTyping = false
    }
    
}

