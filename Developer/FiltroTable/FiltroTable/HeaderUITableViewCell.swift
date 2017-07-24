//
//  HeaderUITableViewCell.swift
//  FiltroTable
//
//  Created by retina on 06/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class HeaderUITableViewCell : UITableViewCell {
    
    @IBOutlet weak var headerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class var instanceNib : String {
        get {
            return "header-cell"
        }
    }
    
    func config(headerText: String) {
        self.headerLabel.text = headerText
    }
    
}
