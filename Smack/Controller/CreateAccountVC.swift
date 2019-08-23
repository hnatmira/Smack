//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Miroslav Hnát on 20/08/2019.
//  Copyright © 2019 Miroslav Hnát. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    //Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func createAccntPressed(_ sender: Any) {
        guard let email = emailTxt.text , emailTxt.text != "" else { return }
        guard let pass = passTxt.text , passTxt.text != "" else { return }

        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                print("Registered user! ")
            }
        }
    }

    @IBAction func pickBGColorPressed(_ sender: Any) {
    }

    @IBAction func pickAvatarPressed(_ sender: Any) {
    }

    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }

}
