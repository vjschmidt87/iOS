//
//  ViewController.swift
//  Animations
//
//  Created by retina on 13/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var editView: UIView!
    
    @IBAction func shrinkWidth(_ sender: UIButton) {
        UIView.animate(withDuration: 2, animations: {
            self.editView.frame = CGRect(x: self.editView.frame.minX, y: self.editView.frame.minY, width: self.editView.frame.width - 20, height: self.editView.frame.height)
        })
    }
    
    @IBAction func shrinkHeight(_ sender: UIButton) {
        UIView.animate(withDuration: 2, animations: {
            self.editView.frame = CGRect(x: self.editView.frame.minX, y: self.editView.frame.minY, width: self.editView.frame.width, height: self.editView.frame.height - 20)
        })
    }
    
    @IBAction func moveRight(_ sender: UIButton) {
        UIView.animate(withDuration: 2, animations: {
            self.editView.frame = CGRect(x: self.editView.frame.minX + 50, y: self.editView.frame.minY, width: self.editView.frame.width, height: self.editView.frame.height)
        })
    }
    
    @IBAction func moveLeft(_ sender: UIButton) {
        UIView.animate(withDuration: 2, animations: {
            self.editView.frame = CGRect(x: self.editView.frame.minX - 50, y: self.editView.frame.minY, width: self.editView.frame.width, height: self.editView.frame.height)
        })
    }
    
    @IBAction func moveUp(_ sender: UIButton) {
        UIView.animate(withDuration: 2, animations: {
            self.editView.frame = CGRect(x: self.editView.frame.minX, y: self.editView.frame.minY - 50, width: self.editView.frame.width, height: self.editView.frame.height)
        })
    }
    
    @IBAction func moveDown(_ sender: UIButton) {
        UIView.animate(withDuration: 2, animations: {
            self.editView.frame = CGRect(x: self.editView.frame.minX, y: self.editView.frame.minY + 50, width: self.editView.frame.width, height: self.editView.frame.height)
        })
    }
    
    @IBAction func fadeIn(_ sender: UIButton) {
        UIView.animate(withDuration: 2, animations: {
            self.editView.alpha = 1
        })
    }
    
    @IBAction func fadeOut(_ sender: UIButton) {
        UIView.animate(withDuration: 2, animations: {
            self.editView.alpha = 0
        })
    }
    
    @IBAction func round(_ sender: UIButton) {
        UIView.animate(withDuration: 1, animations: {
            self.editView.alpha = 0
        }) { (true) in
            UIView.animate(withDuration: 1, animations: {
                self.editView.layer.cornerRadius = self.editView.frame.width/2
                self.editView.alpha = 1
            })
        }
    }
    
    @IBAction func squared(_ sender: UIButton) {
        UIView.animate(withDuration: 1, animations: {
            self.editView.alpha = 0
        }) { (true) in
            UIView.animate(withDuration: 1, animations: {
                self.editView.layer.cornerRadius = 0
                self.editView.alpha = 1
            })
        }
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

