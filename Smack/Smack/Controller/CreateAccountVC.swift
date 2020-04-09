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
    @IBOutlet weak var usernameTxtField: UITextField!
    
    
    
    @IBAction func exitTapped(_ sender: Any) {
        performSegue(withIdentifier: TO_CHANNEL, sender: self)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    
}
