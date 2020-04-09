//
//  ChannelVC.swift
//  Smack
//
//  Created by Nico Yeager on 4/8/20.
//  Copyright © 2020 Nico Yeager. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    //Outlets
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBAction func unwindToChannelVC(segue:UIStoryboardSegue) { }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
        
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //send variables and constants from ChannelVC to LoginVC.  This is the first method called.  Even before viewDidLoad()
    }
    
    
}
