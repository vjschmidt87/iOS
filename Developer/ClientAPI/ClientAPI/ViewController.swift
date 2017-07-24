//
//  ViewController.swift
//  ClientAPI
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var person : Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loaderActivityIndicator.isHidden = true
        self.loaderActivityIndicator.hidesWhenStopped = true
    }
    
    @IBOutlet weak var loaderActivityIndicator: UIActivityIndicatorView!
    
    @IBAction func callAPI(_ sender: UIButton) {
        
        self.loaderActivityIndicator.startAnimating()
        
        Person.getPerson(1) { (person, error) in
            if let response = person {
                if error == 0 {
                    self.person = response
                    print(self.person as Any)
                }
            } else {
                print("Sem Internet")
            }
            
            self.loaderActivityIndicator.stopAnimating()
        }
    }
}
