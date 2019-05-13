import Foundation
import UIKit

class AppContainerViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        AppManager.shared.appContainer = self
        AppManager.shared.showApp()
    }
}
