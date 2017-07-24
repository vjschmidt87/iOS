//
//  CircleView.swift
//  CleaningApp
//
//  Created by retina on 04/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit
import Foundation

class CircleView : UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = self.layer.frame.size.width / 2
    }
}
