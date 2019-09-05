//
//  ScreenRadius.swift
//  Smack
//
//  Created by Miroslav Hnát on 30/08/2019.
//  Copyright © 2019 Miroslav Hnát. All rights reserved.
//

import UIKit

class ScreenRadius: UIView {
    override func awakeFromNib() {
        setupView()
    }

    override func prepareForInterfaceBuilder() {
        super .prepareForInterfaceBuilder()
        setupView()
    }

    func setupView() {
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}
