//
//  RegularUITableViewCell.swift
//  FiltroTable
//
//  Created by retina on 06/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit

class RegularUITableViewCell : UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    class var instanceNib : String {
        get {
            return "content-cell"
        }
    }
    
    func config(contentText: String) {
        self.contentLabel.text = contentText
    }
}
