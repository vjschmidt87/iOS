//
//  CalculatorBrain.swift
//  Calculadora
//
//  Created by retina on 01/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    private var acumulator : Double?
    
    mutating func setOperator(_ operator: Double) {
        self.acumulator = operator
    }
    
    mutating func performOperation(operator: String) {
        
        switch operator {
        case "√":
            acumulator = sqrt(<#T##Double#>)
            break
        default:
            break
        }
        
    }
    
    var result : Double {
        get {
            return acumulator!
        }
    }
}
