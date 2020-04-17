//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Nico Yeager on 4/8/20.
//  Copyright © 2020 Nico Yeager. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    //outlets
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    //Variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5,0.5,0.5,1]"
    var bgColor: UIColor?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
    }
    
    //called when a different VC dismisses back to this VC
    override func viewDidAppear(_ animated: Bool) {
        // if avatar was set in AvatarPickerVC, then set avatar in CreateAccountVC
        if UserDataService.instance.avatarName != "" {
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
        }
        //if the avatar that was selected is "light" and bgColor is not yet set, then set bgColor to light gray
        if avatarName.contains("light") && bgColor == nil {
            userImg.backgroundColor = UIColor.lightGray
        }
    }
    
    //if exit button tapped, then go to ChannelVC
    @IBAction func exitTapped(_ sender: Any) {
        performSegue(withIdentifier: TO_CHANNEL, sender: self)
    }
    
    //if create account is tapped, then register,login, and create user
    @IBAction func createAccountTapped(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        //input variables
        guard let email = emailTxt.text , emailTxt.text != "" else {return}
        guard let pass = passTxt.text , passTxt.text != "" else {return}
        guard let name = userNameTxt.text , userNameTxt.text != "" else {return}
        
        //Call Auth service to register User, then do something if success
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                //Call Auth service to login User, then do something if success
                AuthService.instance.loginUser(email: email, password: pass) { (success) in
                    if success {
                        //Call Auth service to create User, then do something if success
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor) { (success) in
                            if success{
                                self.spinner.isHidden = true
                                self.spinner.stopAnimating()
                                self.performSegue(withIdentifier: TO_CHANNEL, sender: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                            }
                            
                        }
                    }
                }
            }
        }
    }
    
    // Route to AvatarPickerVC if choose Avatar button is pressed
    @IBAction func pickAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
        
    }
    
    // Randomly set bg color if Generate background color is pressed
    @IBAction func pickBGColorPressed(_ sender: Any) {
        bgColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        //animate image for .2 seconds before changing to new bgColor
        UIView.animate(withDuration: 0.2){
            self.userImg.backgroundColor = self.bgColor
        }
    }
    
    // make input placeholder text purple, create tap gesture recognizer to close keyboard if main view is tapped
    func setUpView(){
        
        spinner.isHidden = true
        
        userNameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
        
        passTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
        
        emailTxt.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    //if you use a selector action, you need to wrap the called method in @objc
   @objc func handleTap(){
        view.endEditing(true)
    }
    
}
