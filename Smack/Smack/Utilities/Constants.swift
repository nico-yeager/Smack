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
let TO_AVATAR_PICKER = "toAvatarPicker"

//Colors
let smackPurplePlaceholder = #colorLiteral(red: 0.2588235294, green: 0.3294117647, blue: 0.7254901961, alpha: 0.5)

// Notification Constants
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")


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
