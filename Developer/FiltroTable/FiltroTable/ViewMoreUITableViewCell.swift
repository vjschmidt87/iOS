//
//  ViewMoreUITableViewCell.swift
//  FiltroTable
//
//  Created by retina on 06/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class ViewMoreUITableViewCell : UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    class var instanceNib : String {
        get {
            return "more-cell"
        }
    }
}
