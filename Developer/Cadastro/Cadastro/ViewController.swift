//
//  ViewController.swift
//  Cadastro
//
//  Created by retina on 01/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var warnings: UILabel!
    private var brain = BrainCadastro()
    
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var idade: UITextField!
    
    var displayWarnings: String {
        get {
            return self.warnings.text!
        }
        
        set {
            self.warnings.text = newValue
        }
    }
    
    @IBAction func performSend(_ sender: UIButton) {
        brain.validate(nome: self.nome.text!, email: self.email.text!, idade: self.idade.text!)
        
        
        self.displayWarnings = brain.result
    }
    
}

