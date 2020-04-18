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

    
    func returnUIColor(components: String) -> UIColor {
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        var r, g, b, a: NSString?
        r = scanner.scanUpToCharacters(from: comma) as NSString?
        g = scanner.scanUpToCharacters(from: comma) as NSString?
        b = scanner.scanUpToCharacters(from: comma) as NSString?
        a = scanner.scanUpToCharacters(from: comma) as NSString?

        let defaultColor = UIColor.lightGray
        
        guard let rUnWrapped = r else {return defaultColor}
        guard let gUnWrapped = g else {return defaultColor}
        guard let bUnWrapped = b else {return defaultColor}
        guard let aUnWrapped = a else {return defaultColor}
        
        let rFloat = CGFloat(rUnWrapped.doubleValue)
        let gFloat = CGFloat(gUnWrapped.doubleValue)
        let bFloat = CGFloat(bUnWrapped.doubleValue)
        let aFloat = CGFloat(aUnWrapped.doubleValue)
        
        return UIColor(red: rFloat, green: gFloat, blue: bFloat, alpha: aFloat)
    }
    
    func logOutUser(){
        id = ""
        avatarName = ""
        avatarColor = ""
        email = ""
        name = ""
        AuthService.instance.isLoggedIn = false
        AuthService.instance.userEmail = ""
        AuthService.instance.authToke = ""
    }
    
}
