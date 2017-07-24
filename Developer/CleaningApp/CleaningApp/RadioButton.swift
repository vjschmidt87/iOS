//
//  RadioButton.swift
//  CleaningApp
//
//  Created by retina on 04/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit
import Foundation

class RadioButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = self.layer.frame.size.width / 2
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor(red:206/255.0, green:220/255.0, blue:232/255.0, alpha: 1.0).cgColor
        
        
    }
}

