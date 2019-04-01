import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
<<<<<<< HEAD
//<<<<<<< HEAD
        
        
        
//=======
=======
        
        //alex comment
        
        
>>>>>>> b3f313fd9d16183aa99317b824fadf4bbfe37282
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()

    
<<<<<<< HEAD
//>>>>>>> 12222787e7197ffcf316dc12ef1a8ac6840e8dfe
=======

>>>>>>> b3f313fd9d16183aa99317b824fadf4bbfe37282
    }


}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.last!)
    }
}
