import CoreLocation

extension CLLocationCoordinate2D {
    
    var location: CLLocation {
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
}
