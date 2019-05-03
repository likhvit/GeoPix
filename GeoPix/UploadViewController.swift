import UIKit
import Firebase

class UploadViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var imagePicker: UIImageView!
    @IBOutlet weak var imageDescription: UILabel!
    @IBOutlet weak var imageQuote: UITextField!
    @IBOutlet weak var uploadDate: UILabel!
    var selectedImage: UIImage?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        post()
        
    }
    func post() {
        guard let selectedImage = selectedImage else { return }
        
        upload(selectedImage) { imageName in
            guard let imageName = imageName else { return }
            let ref = Firestore.firestore().collection("locations").document()
            
            let dict: [String: Any] = [
                "name": "Bournemouth",
                "coordinates": GeoPoint(latitude: 0, longitude: 0),
                "imageRef": imageName
            ]
            
            ref.setData(dict) { error in
                print("Image uploaded successfully")
                
            }
        }
    }
    
    func upload(_ image: UIImage, completion: @escaping (String?) -> Void) {
        let data = image.jpegData(compressionQuality: 0.6)!
        let uuid = UUID().uuidString
        let ref = Storage.storage().reference(withPath: uuid)
        let meta = StorageMetadata()
        meta.contentType = "image/jpeg"
        ref.putData(data, metadata: meta) { meta, error in
            completion(meta?.name)
        }
            
    }
    
        @IBAction func importButton( sender:Any) {
            let image = UIImagePickerController()
            image.delegate = self
            
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                image.sourceType = .camera
                self.present (image, animated: true, completion: nil)
            } else {
                print("camera not available")
            }
            image.sourceType = UIImagePickerController.SourceType.photoLibrary
            image.allowsEditing = false
            self.present(image, animated: true){
                
            }
   }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
            selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            self.dismiss(animated: true, completion: nil)
        }
}

