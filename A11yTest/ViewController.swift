//
//  ViewController.swift
//  A11yTest
//
//  Created by Rizwan on 30/09/20.
//

import UIKit

public extension UIBarButtonItem {

    @IBInspectable var accEnabled: Bool {
        get {
            return isAccessibilityElement
        }
        set {
            isAccessibilityElement = newValue
        }
    }

    @IBInspectable var accLabelText: String? {
        get {
            return accessibilityLabel
        }
        set {
            accessibilityLabel = newValue
        }
    }

}

class ViewController: UIViewController {
    private var refreshProgressView: RefreshProgressView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureToolbar()
    }

    func configureToolbar() {
        self.navigationController?.isToolbarHidden = false

        var items = [UIBarButtonItem]()
        items.append( UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil))
        items.append( UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil))
        items.append( UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil))
        items.append( UIBarButtonItem(barButtonSystemItem: .reply, target: self, action: nil))

        guard let refreshProgressView = Bundle.main.loadNibNamed("RefreshProgressView", owner: self, options: nil)?[0] as? RefreshProgressView else {
            return
        }

        self.refreshProgressView = refreshProgressView
        self.refreshProgressView?.isAccessibilityElement = true
        self.refreshProgressView?.accessibilityLabel = "Updating .."
        let refreshProgressItemButton = UIBarButtonItem(customView: refreshProgressView)
        refreshProgressItemButton.accEnabled = true
        refreshProgressItemButton.accLabelText = self.refreshProgressView?.label.text
        items.insert(refreshProgressItemButton, at: 2)
        self.toolbarItems = items
    }
}

