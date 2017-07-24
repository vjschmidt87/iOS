//
//  SecondViewController.swift
//  DemoTestes
//
//  Created by retina on 12/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
