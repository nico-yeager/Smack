//
//  AuthService.swift
//  Smack
//
//  Created by Nico Yeager on 4/9/20.
//  Copyright © 2020 Nico Yeager. All rights reserved.
//

import Foundation
import Alamofire

class AuthService{
    
    //Singleton
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
    
    var authToke: String {
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
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler){
        let lowerCaseEmail = email.lowercased()
        let header = [
            "Content-Type": "application/json; charset=utf-8"
        ]
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        let httpHeader = HTTPHeaders(header)
        
        AF.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: httpHeader).responseString { (response) in
            if let err = response.error {
                print("err \(err)")
            }else{
            debugPrint("Response: \(response)")
            completion(true)
            }
        }
        
    
    
    }
    
}
    
    
    
    
