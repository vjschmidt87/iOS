//
//  SecondViewController.swift
//  CleaningApp
//
//  Created by retina on 04/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func NextStepAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FinalViewController") as! FinalViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
