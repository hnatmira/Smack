//
//  RoundedButton.swift
//  Smack
//
//  Created by Miroslav Hnát on 22/08/2019.
//  Copyright © 2019 Miroslav Hnát. All rights reserved.
//

import UIKit

@IBDesignable

class RoundedButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 5.0 {
        didSet {
            setupView()
        }
    }

    override func awakeFromNib() {
        self.setupView()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }

    func setupView() {
        self.layer.cornerRadius = cornerRadius
    }
}
