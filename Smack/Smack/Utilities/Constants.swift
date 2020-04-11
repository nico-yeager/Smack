//
//  Constants.swift
//  Smack
//
//  Created by Nico Yeager on 4/8/20.
//  Copyright © 2020 Nico Yeager. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let TO_CHANNEL = "unwindSegueToChannelVC"


//User Defaults
let LOGGED_IN_KEY = "loggedIn"
let TOKEN_KEY = "token"
let USER_EMAIL = "userEmail"

//URL Constants
let BASE_URL = "https://mac-chat-app-nico.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let USER_ADD = "\(BASE_URL)user/add"


//HEADERS

let HEADERS = ["Content-Type": "application/json; charset=utf-8"]
