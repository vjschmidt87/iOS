//
//  CircleView.swift
//  Telas
//
//  Created by retina on 03/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit
import Foundation

class CircleView : UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 6
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha: 1.0).cgColor
    }
    
    func setTyped() {
        self.layer.backgroundColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha: 1.0).cgColor
    }
    
}
