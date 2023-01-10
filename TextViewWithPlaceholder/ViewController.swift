//
//  ViewController.swift
//  TextViewWithPlaceholder
//
//  Created by Chrystian Salgado on 10/01/23.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var textview: TextViewPlaceholdable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textview.delegate = self
    }
}

extension ViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        self.updateTextViewPlaceholder(textView)
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        self.updateTextViewPlaceholder(textView)
    }

    private func updateTextViewPlaceholder(_ textView: UITextView) {
        textview.hiddenPlaceholder = textView.text.count != 0
    }
}

