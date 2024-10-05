
import Foundation
import UIKit

extension HomeViewController {
    func setupButtons() {
        homeView.filterButton.addTarget(self, action: #selector(showFilterView), for: .touchUpInside)
        filterView.applyButton.addTarget(self, action: #selector(applyFilter), for: .touchUpInside)
        filterView.closeButton.addTarget(self, action: #selector(closePressed), for: .touchUpInside)
    }
    
    @objc private func showFilterView() {
        if filterView.isHidden {
            filterView.isHidden = false
            UIView.animate(withDuration: 0.3) {
                self.filterView.snp.updateConstraints { make in
                    make.top.equalTo(self.view.snp.bottom).offset(-400)
                }
                self.view.layoutIfNeeded()
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.filterView.snp.updateConstraints { make in
                    make.top.equalTo(self.view.snp.bottom)
                }
                self.view.layoutIfNeeded()
                
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.filterView.isHidden = true
            }
        }
    }
    
    @objc private func closePressed() {
        UIView.animate(withDuration: 0.3) {
            self.filterView.snp.updateConstraints { make in
                make.top.equalTo(self.view.snp.bottom)
            }
            self.view.layoutIfNeeded()
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.filterView.isHidden = true
        }
    }

    @objc private func applyFilter() {
        guard let teamName = filterView.teamTextField.text, !teamName.isEmpty else {
            showAlert(title: "Error", message: "Please enter a team name.")
            return
        }
        
        UIView.animate(withDuration: 0.3) {
            self.filterView.snp.updateConstraints { make in
                make.top.equalTo(self.view.snp.bottom)
            }
            self.view.layoutIfNeeded()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.filterView.isHidden = true
        }
    }

    // MARK: - Helper Method to Show Alert
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }
}
