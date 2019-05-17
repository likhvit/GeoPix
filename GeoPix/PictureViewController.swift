import UIKit
import Firebase

class PictureViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageQuote: UILabel!
    var annotations: CustomAnnotation!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! UploadViewController
        vc.annotations = sender as? CustomAnnotation
    }
    
}
