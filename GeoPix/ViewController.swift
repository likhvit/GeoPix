import UIKit
import CoreLocation
import MapKit

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
        let region = CLCircularRegion(center: coordinate, radius: 300, identifier: "One")
        locationManager.startMonitoring(for: region)



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
}
