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
    
    
    
    @IBAction func exitTapped(_ sender: Any) {
        performSegue(withIdentifier: TO_CHANNEL, sender: self)
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        guard let email = emailTxt.text , emailTxt.text != "" else {return}
        guard let pass = passTxt.text , passTxt.text != "" else {return}
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            
            if success {
                print("registered user")
            }
        }
        
        
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    
}
