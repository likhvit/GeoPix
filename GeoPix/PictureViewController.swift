import UIKit
import Firebase

class PictureViewController: UIViewController {
    
    let watcher = ViewController()
    
    
    var annotations: CustomAnnotation!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super .viewDidLoad()
        watcher.delegate = self
        watcher.loadLocations()
        
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! UploadViewController
        vc.annotations = sender as? CustomAnnotation
    }
    
}

extension PictureViewController: PostDelegate {
    
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
        return watcher.annotations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let postCell = watcher.annotations[indexPath.row]
        cell.textLabel?.text = postCell.title
        cell.detailTextLabel?.text = "\(postCell.coordinate.latitude) - \(postCell.coordinate.longitude)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadRows(at: [indexPath], with: .fade)
    }
    
}
