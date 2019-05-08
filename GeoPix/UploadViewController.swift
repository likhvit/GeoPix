import UIKit
import Firebase


class UploadViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var imagePicker: UIImageView!
    @IBOutlet weak var imageDescription: UILabel!
    @IBOutlet weak var imageQuote: UITextField!
    @IBOutlet weak var uploadDate: UILabel!
    var selectedImage: UIImage?
    
    //calls post function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        post()
        
    }
    //post function that is called above, which executes the following code
    //it takes the image that has been selected and is stored in the "selectedImage" function and uses the upload function to store it on firebase
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
<<<<<<< HEAD
    }
<<<<<<< HEAD
    }
    
    func upload(_ image: UIImage, completion: @escaping (String?) -> Void) {
        let data = image.jpegData(compressionQuality: 0.6)
        let uuid = UUID().uuidString
        let ref = Storage.storage().reference(withPath: uuid)
        let meta = StorageMetadata()
        meta.contentType = "imagejpeg"
        ref.putData(data ?? <#default value#>, metadata: meta) { meta, error in completion(meta?.name)
            
    }
    
        func importButton(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
=======
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
<<<<<<< HEAD
         
=======
        
>>>>>>> b89be69e954aee10da2c28620e37d310f05c633f
        
        //photo reference
>>>>>>> a4b08de63aaa73be41b8155dcd6968b4bc258f6c
        ref.putData(data, metadata: meta) { meta, error in
            completion(meta?.name)
        }
        // Get a reference to the storage service using the default Firebase App
        let storage = Storage.storage()
        
        // Create a storage reference from our storage service
        let storageRef = storage.reference()
        // Parent allows us to move to the parent of a reference
        
        //Photo Download
        // Create a reference with an initial file path and name
       // let pathReference = Storage.reference(withPath: "images/jpg")
        
        // Create a reference to the file you want to download
        let ref = storageRef.child("images/jpg")
        
        // Fetch the download URL
        starsRef.downloadURL { url, error in
            if let error = error {
                // Handle any errors
            } else {
                // Get the download URL for 'images/stars.jpg'
            }
        }
        
        //Photo Upload
        // Data in memory
      // Create a reference to the file you want to upload
        let riversRef = storageRef.child("images/rivers.jpg")
        
        // Upload the file to the path "images/rivers.jpg"
        let uploadTask = riversRef.putData(data, metadata: nil) { (metadata, error) in
            guard let metadata = metadata else {
                // Uh-oh, an error occurred!
                return
            }
            // Metadata contains file metadata such as size, content-type.
            let size = metadata.size
            // You can also access to download URL after upload.
            riversRef.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    // Uh-oh, an error occurred!
                    return
                }
            }
        }
        
        
        
        
    }
    
=======
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
            print("upload finsihed")
            completion(uuid)
        }
    }
    
>>>>>>> fda4783b467ea8894c32f4404e95eaa66087cae5
    //code for the import button that is seen on the first view controller. Opens up the user interface for picking an image and once one is picked it will upload it 
        @IBAction func importButton( sender:Any) {
            let image = UIImagePickerController()
            image.delegate = self
            //checks to see if the camera is available, if it is the code is executed. If anything else (camera isnt available) then the code in the else statement is executes which gives an error message saying the camera isnt available.
<<<<<<< HEAD
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                image.sourceType = .camera
                self.present (image, animated: true, completion: nil)
            } else {
                print("camera not available")
            }
            image.sourceType = UIImagePickerController.SourceType.photoLibrary
            image.allowsEditing = false
=======
    if UIImagePickerController.isSourceTypeAvailable(.camera){
        image.sourceType = .camera
            self.present (image, animated: true, completion: nil)
                } else {
            print("camera not available")
            }
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
>>>>>>> fda4783b467ea8894c32f4404e95eaa66087cae5
            self.present(image, animated: true){
                
            }
   }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imagePicker.image = image
<<<<<<< HEAD
        } else{

        }
        self.dismiss(animated: true, completion: nil)
}

<<<<<<< HEAD

/// test
=======
>>>>>>> b89be69e954aee10da2c28620e37d310f05c633f
}
=======
            upload(image) { _ in}
                } else{
        }
    self.dismiss(animated: true, completion: nil)
        
    }

}
>>>>>>> fda4783b467ea8894c32f4404e95eaa66087cae5
