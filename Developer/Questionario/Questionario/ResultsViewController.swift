//
//  ResultsViewController.swift
//  Questionario
//
//  Created by retina on 04/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var data: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.data.text = results
    }
    private var results: String = ""
    
    func showResults(nome: String, idade: String, genero: String, dia: String, materia: String) {
        results = "Nome: " + nome + "\n"
            + "Idade: " + idade + "\n"
            + "Gênero: " + genero + "\n"
            + "Dia favorito: " + dia + "\n"
            + "Matéria favorita: " + materia
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
