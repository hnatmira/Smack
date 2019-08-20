 //
//  LoginVC.swift
//  Smack
//
//  Created by Miroslav Hnát on 20/08/2019.
//  Copyright © 2019 Miroslav Hnát. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "toCreateAccount", sender: nil)
    }

 }
