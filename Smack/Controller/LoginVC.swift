 //
 //  LoginVC.swift
 //  Smack
 //
 //  Created by Miroslav Hnát on 20/08/2019.
 //  Copyright © 2019 Miroslav Hnát. All rights reserved.
 //

 import UIKit

 class LoginVC: UIViewController {

    //Outputs
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "toCreateAccount", sender: nil)
    }

    @IBAction func loginBtnPressed(_ sender: Any) {
        guard let email = usernameTxt.text, usernameTxt.text != "" else { return }
        guard let pass = passTxt.text, passTxt.text != "" else { return }

        AuthService.instance.loginUser(email: email, password: pass) { (success) in
            if success {
                print("Logged in user!")
            }
        }
    }
 }
