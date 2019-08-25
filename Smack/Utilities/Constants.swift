//
//  Constants.swift
//  Smack
//
//  Created by Miroslav Hnát on 11/08/2019.
//  Copyright © 2019 Miroslav Hnát. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//URL constants
let BASE_URL = "https://chattychatchatchat.herokuapp.com/v1/"
let URL_REGISTR = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_ADD_USER = "\(BASE_URL)user/add"

//Colors
let smackPurplePlaceholder = #colorLiteral(red: 0.3266413212, green: 0.4215201139, blue: 0.7752227187, alpha: 0.5)

//Notification Constant
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")

//Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

//User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedInKey"
let USER_EMAIL = "email"

//Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

let AUTHORIZATION_AND_CONTENT = [
    "Content-Type": "application/json; charset=utf-8",
    "Authorization": "Bearer \(AuthService.instance.authToken)"
]

