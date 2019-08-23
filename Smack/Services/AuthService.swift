//
//  AuthService.swift
//  Smack
//
//  Created by Miroslav Hnát on 20/08/2019.
//  Copyright © 2019 Miroslav Hnát. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {

    static let instance = AuthService()

    let defaults = UserDefaults.standard

    var isLoggedIn: Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }

    var authToken: String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }

    var userEmail: String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }

    func registerUser(email: String, password: String, completition: @escaping CompletionHandler) {

        let lowerCaseEmail = email.lowercased()

        let body: [String: Any] = [

            "email": lowerCaseEmail,
            "password": password
        ]

        Alamofire.request( URL_REGISTR, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString
            { (response) in
                if response.result.error == nil {
                    completition(true)
                } else {
                    completition(false)
                    debugPrint(response.result.error as Any)
                }
        }
    }

    func loginUser(email: String, password: String, completition: @escaping CompletionHandler) {

        let lowerCaseEmail = email.lowercased()

        let body: [String: Any] = [

            "email": lowerCaseEmail,
            "password": password
        ]

        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON
            { (response) in
                if response.result.error == nil {
                    //old version for catching JSON response data 
                    //                if let json = response.result.value as? Dictionary<String, Any> {
                    //                    if let email = json ["user"] as? String {
                    //                        self.userEmail = email
                    //                    }
                    //                    if let token = json ["token"] as? String {
                    //                        self.authToken = token
                    //                    }
                    // using SwiftyJSON
                    guard let data = response.data else { return }
                    let json = try! JSON(data: data)
                    self.userEmail = json["user"].stringValue
                    self.authToken = json["token"].stringValue

                    self.isLoggedIn = true
                    completition(true)
                } else {
                    completition(false)
                    debugPrint(response.result.error as Any)
                }
        }
    }

    func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler) {
        let  lowerCaseEmail = email.lowercased()

        let body: [String: Any] = [
            "name": name,
            "email": lowerCaseEmail,
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]

        Alamofire.request(URL_ADD_USER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: AUTHORIZATION_AND_CONTENT).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                let json = try! JSON(data: data)
                let name = json["name"].stringValue
                let email = json["email"].stringValue
                let avatarName = json["avatarName"].stringValue
                let avatarColor = json["avatarColor"].stringValue
                let id = json["_id"].stringValue

                userDataService.instance.setUserData(id: id, color: avatarColor, avatarName: avatarName, email: email, name: name)
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
