//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Miroslav Hnát on 20/08/2019.
//  Copyright © 2019 Miroslav Hnát. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }


}
