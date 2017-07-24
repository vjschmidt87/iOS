//
//  ViewController.swift
//  Questionario
//
//  Created by retina on 03/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var idade: UITextField!
    @IBOutlet weak var genero: UISegmentedControl!
    @IBOutlet weak var dia: UISegmentedControl!
    @IBOutlet weak var materia: UISegmentedControl!
    
    @IBOutlet weak var warnings: UILabel!
    
    private var brain = BrainQuestionario()
    
    private var displayWarnings: String {
        get {
            return self.warnings.text!
        }
        
        set {
            self.warnings.text = newValue
        }
    }
    
    private var generos: Dictionary<Int, String> = [
        0: "Masculino",
        1: "Feminino"
    ]
    
    private var dias: Dictionary<Int, String> = [
        0: "Domingo",
        1: "Segunda-Feira",
        2: "Terça-Feira",
        3: "Quarta-Feira",
        4: "Quinta-Feira",
        5: "Sexta-Feira",
        6: "Sábado"
    ]
    
    private var materias: Dictionary<Int, String> = [
        0: "Matemática",
        1: "Português",
        2: "Ciências",
        3: "Geografia"
    ]
    
    @IBAction func performSend(_ sender: UIButton) {
        brain.validate(nome: self.nome.text!, idade: self.idade.text!, genero: generos[self.genero.selectedSegmentIndex]!, dia: dias[self.dia.selectedSegmentIndex]!, materia: materias[self.materia.selectedSegmentIndex]!)
        
        
        self.displayWarnings = brain.result
        
        if self.displayWarnings == "" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
            vc.showResults(nome: self.nome.text!, idade: self.idade.text!, genero: generos[self.genero.selectedSegmentIndex]!, dia: dias[self.dia.selectedSegmentIndex]!, materia: materias[self.materia.selectedSegmentIndex]!)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

