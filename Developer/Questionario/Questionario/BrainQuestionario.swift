//
//  BrainQuestionario.swift
//  Questionario
//
//  Created by retina on 04/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

class BrainQuestionario {
    private var validation = ""
    
    private func performValidationNome(_ nome: String) {
        if nome.isEmpty {
            self.validation += "Nome: campo está vazio\n"
        } else {
            let nomeRegEx = "[A-Za-z]+\\ [A-Za-z]+"
            
            let nomeTest = NSPredicate(format:"SELF MATCHES %@", nomeRegEx)
            if !nomeTest.evaluate(with: nome) {
                self.validation += "Nome: é necessário nome e sobrenome\n"
            }
        }
    }
    
    private func performValidationIdade(_ idade: String) {
        if idade.isEmpty {
            self.validation += "Idade: campo está vazio"
        } else if Int(idade)! < 0 {
            self.validation += "Idade: é necessário ser maior de 0 anos"
        }
    }
    
    func validate(nome: String, idade: String, genero: String, dia: String, materia: String) {
        
        self.validation = ""
        
        self.performValidationNome(nome)
        self.performValidationIdade(idade)
        
    }
    
    var result: String {
        get {
            return self.validation
        }
    }

}
