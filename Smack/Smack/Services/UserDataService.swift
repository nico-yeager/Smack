//
//  UserDataService.swift
//  Smack
//
//  Created by Nico Yeager on 4/10/20.
//  Copyright © 2020 Nico Yeager. All rights reserved.
//

import Foundation


class UserDataService {
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private (set) var avatarColor = ""
    public private (set) var avatarName = ""
    public private (set) var email = ""
    public private (set) var name = ""
    
    func setUserData(id: String, color: String, avatarName: String, email: String, name: String){
        self.avatarName = avatarName
        self.id = id
        self.avatarColor = color
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName:String){
        self.avatarName = avatarName
    }

    func setAvatarColor(avatarColor:String){
        self.avatarColor = avatarColor
    }
    
    
}
