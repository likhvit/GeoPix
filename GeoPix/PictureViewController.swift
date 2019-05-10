import UIKit
import Firebase

class PictureViewController: UIViewController {
    
    var annotations: CustomAnnotation!
   
//    @IBAction func uploadButton(_ sender: Any) {
//        let annotation = view.annotation!
//        performSegue(withIdentifier: "upload", sender: annotation)
//    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! UploadViewController
        vc.annotations = sender as? CustomAnnotation
    }
    
}
