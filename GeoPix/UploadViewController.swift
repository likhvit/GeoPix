import UIKit
import Firebase

class UploadViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var imagePicker: UIImageView!
    @IBOutlet weak var imageDescription: UILabel!
    @IBOutlet weak var uploadDate: UILabel!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let image = UIImage(named: "test")
        
        let data = image!.jpegData(compressionQuality: 0.5)!
        
        let ref = Storage.storage().reference(withPath: "test")
        ref.putData(data, metadata: nil) { meta, error in
            print("finished")
        }
        
        
    }
    
    @IBAction func importButton(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            image.sourceType = .camera
            self.present (image, animated: true, completion: nil)
        } else {
            print("camera not available")
        }
        
        image.sourceType =
            UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true){
            
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imagePicker.image = image
        } else{
            //error
        }
        self.dismiss(animated: true, completion: nil)
        
    }

    
}


/// test
