//
//  SignupVC.swift
//  Repal
//
//  Created by Mac on 27/10/20.
//

import Foundation
import UIKit

class SignupVC: UIViewController {
    @IBOutlet weak var tfmMobile: UITextField!
    var openType = ""
    var callBack : ((String)-> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
   
  
    
    @IBAction func actionLogin(_ sender: Any) {
        self.view.endEditing(true)
 
    }

    
 
}
