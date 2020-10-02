//
//  RefreshProgressView.swift
//  A11yTest
//
//  Created by Rizwan on 30/09/20.
//

import Foundation
import UIKit

class RefreshProgressView: UIView {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        update()
    }

    func update() {
        progressView.isHidden = true
        label.text = "Updating..."
    }
}
