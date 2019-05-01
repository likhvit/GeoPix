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
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()

        let coordinate = CLLocationCoordinate2D(latitude: 50.716088, longitude: -1.874064)
        //mapView.setRegion(region, animated: true)
        let region = CLCircularRegion(center: coordinate, radius: 300, identifier: "One")
        locationManager.startMonitoring(for: region)
        
        //let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        //let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50.721972, longitude: -1.873795), span: span)
        //sets the map to the Region and it is animated as it moves to it
        //mapView.setRegion(region, animated: true)
        
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

