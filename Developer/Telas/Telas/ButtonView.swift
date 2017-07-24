//
//  ButtonView.swift
//  Telas
//
//  Created by retina on 03/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit
import Foundation

class ButtonView: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha: 1.0).cgColor

        
    }
}
