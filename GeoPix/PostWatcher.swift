//import Firebase
//import CoreLocation
//
//protocol FriendWatcherDelegate {
//  func didUpdate()
//}
//
//class PostWatcher {
//
//  var name: String!
//
//  var delegate: FriendWatcherDelegate?
//  let ref = Firestore.firestore().collection("locations")
//
//  var annotation = [CustomAnnotation]()
//
//  init(name: String) {
//    self.name = name
//  }
//
//  func startWatchingFriends() {
//    ref.addSnapshotListener { snapshot, error in
//      guard let snapshot = snapshot else { return }
//      self.annotation.removeAll()
//      for document in snapshot.documents {
//        guard let annotation = CustomAnnotation(document: document) else { continue }
//        self.annotation.append(annotation)
//      }
//      self.delegate?.didUpdate()
//    }
//  }
//
//  func setLocation(_ location: CLLocation) {
//    let myRef = Firestore.firestore().collection("locations").document(name)
//    let geoPoint = GeoPoint(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//    myRef.setData(["location": geoPoint], merge: true)
//  }
//
//}
