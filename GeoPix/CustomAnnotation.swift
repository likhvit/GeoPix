import Foundation
import MapKit
import Firebase

class CustomAnnotation: NSObject, MKAnnotation {
    
    //variable which stores the coordinate
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String? {
        return "Distance: \(distance/1000)km"
    }
    var distance: CLLocationDistance = 99999
    
    init(document: DocumentSnapshot) {
        let data = document.data()!
        title = data["name"] as? String
        let geoPoint = data["coordinates"] as! GeoPoint
        coordinate = CLLocationCoordinate2D(latitude: geoPoint.latitude, longitude: geoPoint.longitude)
    }
    
}
