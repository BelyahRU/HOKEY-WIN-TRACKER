
import Foundation
import UIKit

extension TeamProfileViewController {
    func setupButtons() {
        teamProfileView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
    }
    
    @objc
    func backPressed() {
        self.navigationController?.popViewController(animated: false)
    }
}
