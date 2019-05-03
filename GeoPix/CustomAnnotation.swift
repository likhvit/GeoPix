import Foundation
import MapKit
import Firebase

class CustomAnnotation: NSObject, MKAnnotation {
    
    //variable which stores the coordinate
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String) {
        self.coordinate = coordinate
        self.title = title
    }
    
}
