import UIKit
import Firebase

class PictureViewController: UIViewController {
    
    let watcher = PostWatcher(name: "")

    var annotations: CustomAnnotation!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super .viewDidLoad()
        watcher.delegate = self
        watcher.startWatchingFriends()
        
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! UploadViewController
        vc.annotations = sender as? CustomAnnotation
    }
    
}

extension PictureViewController: FriendWatcherDelegate {
    
    func didUpdate() {
        if tableView.numberOfRows(inSection: 0) != watcher.name.count {
            tableView.reloadData()
        }
        
        if let indexPaths = tableView.indexPathsForVisibleRows {
            tableView.reloadRows(at: indexPaths, with: .fade)
        }
    }
    
}


extension PictureViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return watcher.name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let friendForCell = watcher.name[indexPath.row]
        cell.textLabel?.text = friendForCell.name
        cell.detailTextLabel?.text = "\(friendForCell.location.latitude) - \(friendForCell.location.longitude)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadRows(at: [indexPath], with: .fade)
    }
    
}
