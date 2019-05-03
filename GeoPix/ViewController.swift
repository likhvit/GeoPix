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
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()

        mapView.userTrackingMode = .follow
        
        let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50.721972, longitude: -1.873795), span: span)
        //sets the map to the Region and it is animated as it moves to it
        let coordinate = CLLocationCoordinate2D(latitude: 50.714967, longitude: -1.875129)
        let annotation = CustomAnnotation(coordinate: coordinate, title: "Pier")
        
        let newCoordinate = CLLocationCoordinate2D(latitude: 50.742192, longitude: -1.895961)
        let newAnnotation = CustomAnnotation(coordinate: newCoordinate, title: "University")
        
        mapView.setRegion(region, animated: true)
//        locationManager.startMonitoring(for: region)

        
        func loadLocations() {
            let ref = Firestore.firestore().collection("locations")
            ref.getDocuments { snapshot, error in
                for document in snapshot!.documents {
                    print(document.data())
                }
            }
        }
        

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        uploadImage = false
    }

}

    extension ViewController: CLLocationManagerDelegate {
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            print(locations.last!)
        }
        
        func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
            print("Entered: \(region.identifier)")
                if uploadImage == false {
                uploadImage = true
                performSegue(withIdentifier: "upload", sender: nil)
            }
        }
        func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
            print("Left: \(region.identifier)")
        }
        
}

