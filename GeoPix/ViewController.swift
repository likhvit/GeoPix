import UIKit
import CoreLocation
import MapKit
import Firebase

class ViewController: UIViewController {
    

    @IBOutlet weak var mapView: MKMapView!
    
    class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
   
        var mapView:MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //determines user location
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
        //the regeion in which users can use the app and upload pictures of bournemouth
        let coordinate = CLLocationCoordinate2D(latitude: 50.716088, longitude: -1.874064)
        let region = CLCircularRegion(center: coordinate, radius: 300, identifier: "One")
        locationManager.startMonitoring(for: region)
    
        //locations in firestore
        func loadLocations() {
            let ref = Firestore.firestore().collection("locations")
            ref.getDocuments { snapshot, error in
                for document in snapshot!.documents {
                    print(document.data())
                }
            }
        }

}
    }
    

    //extension which is needed to preevent errors
}
    extension ViewController: CLLocationManagerDelegate {
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            
            
            print(locations.last!)
        }
        
        func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
            print("Entered: \(region.identifier)")
        }
        func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
            print("Left: \(region.identifier)")
        }
        
}

