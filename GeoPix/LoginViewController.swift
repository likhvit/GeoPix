import Foundation
import UIKit
import Firebase

class LoginViewController: UIViewController{

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        Auth.auth().signIn(withEmail: "test@test.com", password: "password") { result, error in
            if let _ = result?.user {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
}

