//
//

import UIKit

 
class loginVC: UIViewController {
    @IBOutlet weak var tfmMobile: UITextField!
    var openType = ""
    @IBOutlet weak var tfmPassword: UITextField!
    var callBack : ((String)-> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
     
         // Do any additional setup after loading the view.
   
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    
    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        self.view.endEditing(true)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "VerifyUserVC") as! VerifyUserVC
        
        self.navigationController?.pushViewController(vc, animated: true)


    }
   
    
    @IBAction func actionCoachSigninup(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignupVC") as! SignupVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func actionForget(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPassword") as! ForgotPassword
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
   
}
