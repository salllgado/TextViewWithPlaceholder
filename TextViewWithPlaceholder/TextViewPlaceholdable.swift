//
//  TextViewPlaceholdable.swift
//  TextViewWithPlaceholder
//
//  Created by Chrystian Salgado on 10/01/23.
//

import UIKit

@IBDesignable
final class TextViewPlaceholdable: UITextView {
    
    @IBInspectable var placeholder: String = "Placeholder" {
        didSet {
            self.placeholderLabel.text = placeholder
        }
    }
    
    /// Set placeholder label enabled to be handler
    @IBInspectable var placeholderEnabled: Bool = true
    
    /// Control visibility of placeholder
    var hiddenPlaceholder: Bool = false {
        didSet {
            guard placeholderEnabled else { return }
            self.placeholderLabel.isHidden = hiddenPlaceholder
        }
    }
    
    private lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .tertiaryLabel
        return label
    }()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        placeholderLabel.isHidden = !placeholderEnabled
        
        addSubview(placeholderLabel)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4).isActive = true
        placeholderLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4).isActive = true
        placeholderLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 9).isActive = true
    }
    
}
