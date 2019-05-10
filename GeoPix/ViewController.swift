import UIKit
import CoreLocation
import MapKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    var uploadImage = false
    var annotations = [CustomAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //determines user location
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()

        
        mapView.delegate = self
        
        mapView.userTrackingMode = .follow

        //calls loadLocations funcion
        loadLocations()
        
        let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50.721972, longitude: -1.873795), span: span)
        //sets the map to the Region and it is animated as it moves to it

        
        
        mapView.setRegion(region, animated: true)
//        locationManager.startMonitoring(for: region)

    

        //the region in which users can use the app and upload pictures of bournemouth
        for annotation in annotations {

            //sets the radius of the region to 100 in which the user needs to be in in order to upload photos
            let region = CLCircularRegion(center: annotation.coordinate, radius: 300, identifier: annotation.title!)
        locationManager.startMonitoring(for: region)
            print("entered location")
        }
        

    }
    
    //locations in firestore
    //loadLocations function that is called above
    func loadLocations() {
        let ref = Firestore.firestore().collection("locations")
        ref.getDocuments { snapshot, error in
            for document in snapshot!.documents {
                let annotation = CustomAnnotation(document: document)
                self.annotations.append(annotation)
                self.mapView.addAnnotation(annotation)
            }
        }
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        uploadImage = false
//    }
//
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! UploadViewController
        vc.annotations = sender as? CustomAnnotation
    }

}

    //extension which is needed to prevent errors
    extension ViewController: CLLocationManagerDelegate {
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let userlocation = locations.last else { return }
            
            for annotation in annotations {
               annotation.distance = userlocation.distance(from: annotation.coordinate.location)
            }
            
        }
        
}
//extension to prevent crashes
extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let annotation = view.annotation!
        performSegue(withIdentifier: "picture", sender: annotation)
    }

}


