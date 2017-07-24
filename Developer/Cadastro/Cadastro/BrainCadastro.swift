//
//  BrainCadastro.swift
//  Cadastro
//
//  Created by retina on 01/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct BrainCadastro {
    
    private var validation = ""
    
    private mutating func performValidationNome(_ nome: String) {
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
    
    private mutating func performValidationEmail(_ email: String) {
        if email.isEmpty {
            self.validation += "E-mail: campo está vazio\n"
        } else {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            if !emailTest.evaluate(with: email) {
                self.validation += "Email: endereço inválido\n"
            }
        }
    }
    
    private mutating func performValidationIdade(_ idade: String) {
        if idade.isEmpty {
            self.validation += "Idade: campo está vazio"
        } else if Int(idade)! < 18 {
            self.validation += "Idade: é necessário ser maior de 18 anos"
        }
    }
    
    mutating func validate(nome: String, email: String, idade: String) {
        
        self.validation = ""
        
        self.performValidationNome(nome)
        self.performValidationEmail(email)
        self.performValidationIdade(idade)
        
    }
    
    var result: String {
        get {
            return self.validation
        }
    }
}


