//
//  AuthService.swift
//  Smack
//
//  Created by Nico Yeager on 4/9/20.
//  Copyright © 2020 Nico Yeager. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

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
    
    
    //register user to mac-chat-api
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler){
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        AF.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HTTPHeaders(HEADERS)).responseString { (response) in
            
            switch response.result {
                
            case .success:
                debugPrint("Response: \(response)")
                completion(true)
                
            case .failure(let value):
                completion(false)
                print("err: \(value)")
                
            }
            
        }
    }
    
    
    //login user to mac-chat-api
    func loginUser (email: String, password: String, completion: @escaping CompletionHandler){
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        AF.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HTTPHeaders(HEADERS)).responseJSON { (response) in
            
            // result of AF request
            switch response.result {
             
            // if request was a success, set the userEmail and authToke from the json response
            case .success(let value):
                let json = JSON(value)
                self.userEmail = json["user"].stringValue
                self.authToke = json["token"].stringValue
                self.isLoggedIn = true
                completion(true)
            
            //if request was a failure, print out the error and set the completion handler to false.
            case .failure(let error):
                print(error)
                completion(false)
            }
        }
    }
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler){
        
        let lowerCaseEmail = email.lowercased()
        let body: [String: Any] = [
            "name": name,
            "email": lowerCaseEmail,
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]
        
        let header = [
            "Authorization": "Bearer \(AuthService.instance.authToke)",
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        
        AF.request(USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HTTPHeaders(header)).responseJSON { (response) in
            
            // result of AF request
            switch response.result {
             
            // if request was a success, set the userEmail and authToke from the json response
            case .success(let value):
                
                let json = JSON(value)
                
                UserDataService.instance.setUserData(id: json["id"].stringValue, color: json["avatarColor"].stringValue, avatarName: json["avatarName"].stringValue, email: json["email"].stringValue, name: json["name"].stringValue)
            
                self.isLoggedIn = true
                completion(true)
            
            //if request was a failure, print out the error and set the completion handler to false.
            case .failure(let error):
                print(error)
                completion(false)
            }
        }
        
    }
    
    
}







