//
//  ResetPasswordVC.swift
//  SocialApp
//
//  Created by mac on 01/08/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class ResetPasswordVC: UIViewController {
    @IBOutlet weak var tfmComPassword: UITextField!
    @IBOutlet weak var tfmPassword: UITextField!
    var email = ""
    @IBOutlet weak var tfOTP: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    


    
    @IBAction func actionContinue(_ sender: Any) {
      
    }
    

    
    
   
}
