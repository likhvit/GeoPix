import UIKit
import Firebase

class PictureViewController: UIViewController {
    
    var annotations: CustomAnnotation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func uploadButton(_ sender: Any) {
        let annotation = view.annotation!
        performSegue(withIdentifier: "upload", sender: annotation)
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! PictureViewController
        vc.annotations = sender as? CustomAnnotation
    }
    
}
