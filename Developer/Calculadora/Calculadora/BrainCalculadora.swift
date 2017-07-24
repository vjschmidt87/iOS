//
//  BrainCalculadora.swift
//  Calculadora
//
//  Created by retina on 03/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct BrainCalculadora {
    
    private var acumulator: Double?
    private var operationsHistory = ""
    private var binaryStarted = false
    
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double, Double) -> Double)
        case equals
    }
    
    private var operations: Dictionary<String, Operation> = [
        "π": Operation.constant(Double.pi),
        "e": Operation.constant(M_E),
        "√": Operation.unaryOperation(sqrt),
        "+": Operation.binaryOperation({ $0 + $1 }),
        "-": Operation.binaryOperation({ $0 - $1 }),
        "x": Operation.binaryOperation({ $0 * $1 }),
        "/": Operation.binaryOperation({ $0 / $1 }),
        "=": Operation.equals
    ]
    
    mutating func setOperator(_ operand : Double) {
        self.acumulator = operand
    }
    
    private var pbo: PendingBinaryOperation?
    
    private struct PendingBinaryOperation {
        let function: ((Double, Double) -> Double)
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
    private mutating func performPendingBinaryOperation() {
        if pbo != nil && acumulator != nil {
            acumulator = pbo!.perform(with: acumulator!)
            pbo = nil
        }
    }
    
    mutating func performOperation(_ symbol: String) {
        if let operation = self.operations[symbol] {
            switch operation {
            case .constant(let value):
                self.acumulator = value
                history = symbol + "\n"
            case .unaryOperation(let function):
                if acumulator != nil {
                    history = symbol + String(acumulator!) + "\n"
                    self.acumulator = function(acumulator!)
                }
            case .binaryOperation(let function):
                if acumulator != nil {
                    history = String(acumulator!) + " " + symbol
                    self.pbo = PendingBinaryOperation(function: function, firstOperand: acumulator!)
                    acumulator = nil
                    binaryStarted = true
                }
            case .equals:
                if binaryStarted {
                    history = " " + String(acumulator!) + "\n"
                    binaryStarted = false
                }
                performPendingBinaryOperation()
                
            }
        }
    }
    
    var result: Double? {
        get {
            return acumulator
        }
    }
    
    var history: String? {
        get {
            return operationsHistory
        }
        set {
            operationsHistory += newValue!
        }
    }
    
}
