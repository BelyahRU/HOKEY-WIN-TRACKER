
import Foundation
import UIKit

extension HomeViewController {
    func setupButtons() {
        homeView.filterButton.addTarget(self, action: #selector(showFilterView), for: .touchUpInside)
        filterView.applyButton.addTarget(self, action: #selector(applyFilter), for: .touchUpInside)
    }
    
    // MARK: - Actions
        @objc private func showFilterView() {
            if filterView.isHidden {
                filterView.isHidden = false
                // Анимация: показываем filterView с нижней границы экрана
                UIView.animate(withDuration: 0.3) {
                    self.filterView.snp.updateConstraints { make in
                        make.top.equalTo(self.view.snp.bottom).offset(-350)
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

        @objc private func applyFilter() {
            // Проверка заполненности текстового поля
            guard let teamName = filterView.teamTextField.text, !teamName.isEmpty else {
                showAlert(title: "Error", message: "Please enter a team name.")
                return
            }
            
            // Если проверка пройдена, скрываем filterView
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
