import UIKit
import Firebase

//protocol SecondViewControllerDelegate {
//    func didUpdate(annotation: CustomAnnotation)
//}

class UploadViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var imagePicker: UIImageView!
    @IBOutlet weak var imageQuote: UITextField!
    
    
    //inside view did load
    //label.text = customaAnn.name
    //label.text = "\(customAnn.name!)"

    
    var selectedImage: UIImage?
    
    var annotations: CustomAnnotation!
   
    //post function that is called above, which executes the following code
    //it takes the image that has been selected and is stored in the "selectedImage" function and uses the upload function to store it on firebase
    func post() {
        guard let selectedImage = selectedImage else { return }
        
        upload(selectedImage) { imageName in
            guard let imageName = imageName else { return }
            let ref = Firestore.firestore().collection("posts").document()
//            guard let title = title else { return }
//            let ref = Firestore.firestore().collection("posts").document()
            
            //metadata for each picture that is uploaded
            let dict: [String: Any] = [
                "name": "",
                "coordinates": GeoPoint(latitude: 0, longitude: 0),
                "imageRef": imageName
            ]
            
            ref.setData(dict) { error in
                print("Image uploaded successfully")
                self.dismiss(animated: true, completion: nil)
            }
        
            
        }
    }
    
    @IBAction func quoteWriter(_ sender: Any) {
        post()
    }
    //calls post function
    @IBAction func postButton(_ sender: Any) {
        post()
    }
    //upload function which is called during the post function. Takes the image, gives it a random string for its file name with the uuii variable and also stores metadata on the file. A random string is needed for the file name as if there wasnt then it would be posible for images to overwrite each other.
    func upload(_ image: UIImage, completion: @escaping (String?) -> Void) {
        //compresses the file
        let data = image.jpegData(compressionQuality: 0.6)!
        //gives a random string to the uploaded image
        let uuid = UUID().uuidString
        let ref = Storage.storage().reference(withPath: uuid)
        let meta = StorageMetadata()
        //declares the content type
        meta.contentType = "image/jpeg"
        
        ref.putData(data, metadata: meta) { meta, error in
            print("upload finished")
            completion(uuid)
        }
    }
    
    //code for the import button that is seen on the first view controller. Opens up the user interface for picking an image and once one is picked it will upload it
    @IBAction func importButton( sender:Any) {
        let image = UIImagePickerController()
        image.delegate = self
        //checks to see if the camera is available, if it is the code is executed. If anything else (camera isnt available) then the code in the else statement is executes which gives an error message saying the camera isnt available.
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

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imagePicker.image = image
            upload(image) { _ in
                
            }
        } else{
            
        }
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        _ = segue.destination as! PictureViewController
    }

    
}
