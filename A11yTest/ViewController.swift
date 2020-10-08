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

        guard let customView = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?[0] as? CustomView else {
            return
        }

        let refreshProgressItemButton = UIBarButtonItem(customView: refreshProgressView)

        let view = UIBarButtonItem(customView: customView)

        items.insert(view, at: 3)
        items.insert(refreshProgressItemButton, at: 2)
        self.toolbarItems = items
    }

    @objc func onTap() {

    }
}

extension UIBarButtonItem {
    static func button(image: UIImage, title: String, target: Any, action: Selector) -> UIBarButtonItem {
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
        button.setTitle(title, for: .normal)
        button.sizeToFit()
        return UIBarButtonItem(customView: button)
    }

    static func label(title: String) -> UIBarButtonItem {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textColor = .secondaryLabel
        label.text = title
        label.sizeToFit()
        return UIBarButtonItem(customView: label)
    }

    static func progressView(title: String) -> UIBarButtonItem {
        let stackView = UIStackView.init()
        stackView.alignment = .center
        let label = UILabel()
        label.text = title
        label.sizeToFit()
        let progressView = UIProgressView()
        stackView.addSubview(label)
        stackView.addSubview(progressView)
        return UIBarButtonItem(customView: stackView)
    }
}
