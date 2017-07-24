//
//  BorderedButton.swift
//  CleaningApp
//
//  Created by retina on 04/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit
import Foundation

class BorderedButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 3
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor(red:72/255.0, green:179/255.0, blue:226/255.0, alpha: 1.0).cgColor
        
        
    }
}

