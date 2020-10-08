//
//  CustomView.swift
//  A11yTest
//
//  Created by Rizwan on 06/10/20.
//

import Foundation
import UIKit

class CustomView: UIView {
    @IBOutlet weak var progressView: UIProgressView!

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        update()
    }

    func update() {
        progressView.isHidden = true
        label.text = "UPDATING"
        isAccessibilityElement = true
        accessibilityTraits = [.staticText]
        accessibilityLabel = "..Updating.."
    }
}
