//
//  ForgotPassword.swift
//  AMCoaching
//
//  Created by mac on 04/10/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ForgotPassword: UIViewController {
    
    
    @IBOutlet weak var tfEmail: UITextField!
    var callBack : ((String)-> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    
    @IBAction func actionLogin(_ sender: Any) {
        self.view.endEditing(true)
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
 
    
    @IBAction func actionReset(_ sender: Any) {
        let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "ResetPasswordVC") as! ResetPasswordVC
      //  vc1.email = self.tfEmail.text!
        self.navigationController?.pushViewController(vc1, animated: false)

    }
    
}


