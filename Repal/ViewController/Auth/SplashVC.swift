//


import UIKit
import SDWebImage
class SplashVC: UIViewController {
   
    @IBOutlet weak var imgLoad: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
         
        
     }
   
    
    override func viewDidAppear(_ animated: Bool) {

        let vc  = self.storyboard?.instantiateViewController(identifier: "loginVC") as! loginVC
        self.navigationController?.pushViewController(vc, animated: false)
        
        
    }


    
    
 

}
