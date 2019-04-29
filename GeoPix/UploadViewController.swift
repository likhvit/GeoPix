import UIKit
import Firebase

class UploadViewController: UIViewController {
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let image = UIImage(named: "test")
        
        let data = image!.jpegData(compressionQuality: 0.5)!
        
        let ref = Storage.storage().reference(withPath: "test")
        ref.putData(data, metadata: nil) { meta, error in
            print("finished")
        }
        
        
    }
    
    
}
