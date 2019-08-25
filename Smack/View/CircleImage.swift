//
//  CircleImage.swift
//  Smack
//
//  Created by Miroslav Hnát on 25/08/2019.
//  Copyright © 2019 Miroslav Hnát. All rights reserved.
//

import UIKit

@IBDesignable

class CircleImage: UIImageView {

    override func awakeFromNib() {
        setupView()
    }

    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
}
