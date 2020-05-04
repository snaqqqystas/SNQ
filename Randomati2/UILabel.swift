//
//  UILabel.swift
//  Randomati2
//
//  Created by SNQMACPRO on 13.04.2020.
//  Copyright © 2020 SNQMACPRO. All rights reserved.
//

import UIKit

extension UILabel {
    var optimalHeight: CGFloat {
        get {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: CGFloat.greatestFiniteMagnitude))
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.font = self.font
            label.text = self.text
            label.sizeToFit()
            return label.frame.height
        }
    }
}
