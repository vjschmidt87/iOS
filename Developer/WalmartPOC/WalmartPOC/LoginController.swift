//
//  LoginController.swift
//  WalmartPOC
//
//  Created by retina on 15/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation
import UIKit

class LoginController: UIViewController {
    
    
    @IBOutlet weak var warningLabel: UILabel!
    
    var validCPF: Bool?
    
    override func viewDidLoad() {
        if UIDevice().type == .simulator {
            print("You're running on the simulator... boring!")
        } else {
            print("Wow! Running on a \(UIDevice().type.rawValue)")
        }
        super.viewDidLoad()
        self.configViewToDismissKeyboardOnTap(self.view)
        self.warningLabel.isHidden = true
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginField(_ sender: UITextField) {
        sender.textColor = UIColor.black
        
    }
    @IBAction func checkMaxLengthOnTyping(_ sender: UITextField) {
        print(sender.text!.characters.count)
        //TODO fazer impedimento de + que 11 nros
    }
    
    @IBAction func loginFieldOut(_ sender: UITextField) {
        if sender.text == "" {
            sender.textColor = UIColor(red: 153.0 / 255.0, green: 153.0 / 255.0, blue: 153.0 / 255.0, alpha: 1.0)
            sender.text = "Insira seu CPF"
            sender.clearsOnBeginEditing = true
        } else {
            self.validCPF = sender.text!.isValidCPF
            if !validCPF! {
                self.warningLabel.isHidden = false
            } else {
                self.warningLabel.isHidden = true
            }
            sender.clearsOnBeginEditing = false
        }
    }
}
