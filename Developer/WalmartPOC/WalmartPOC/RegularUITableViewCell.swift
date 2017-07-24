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
    
    var cornerRule = -1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cornerRadiusSetup()
        
    }
    
    class var instanceNib : String {
        get {
            return "content-cell"
        }
    }
    
    func config(contentText: String, cornerRule: Int) {
        self.cornerRule = cornerRule
        self.contentLabel.text = contentText
        cornerRadiusSetup()
    }
    
    func cornerRadiusSetup() {
        let screenSize: CGRect = UIScreen.main.bounds
        let rect = CGRect(x: 0, y: 0, width: screenSize.width * 3, height: self.frame.height)
        let corners = CGSize(width: 4.0, height: 4.0)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        if cornerRule == 0 {
            let maskPAth = UIBezierPath(roundedRect: rect,
                                         byRoundingCorners: [.topLeft, .topRight],
                                         cornerRadii: corners)
            
            maskLayer.path = maskPAth.cgPath
            self.layer.mask = maskLayer
        }else if cornerRule == 1 {
            let maskPAth = UIBezierPath(roundedRect: rect,
                                         byRoundingCorners: [.bottomLeft, .bottomRight],
                                         cornerRadii: corners)
            
            maskLayer.path = maskPAth.cgPath
            self.layer.mask = maskLayer
        } else if cornerRule == 2 {
            self.layer.cornerRadius = 4.0
        }
    }
}
