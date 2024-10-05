
import Foundation
import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setupUpcomingCollectionView() {
        homeView.upcomingCollectionView.delegate = self
        homeView.upcomingCollectionView.dataSource = self
        homeView.upcomingCollectionView.showsHorizontalScrollIndicator = false
        homeView.upcomingCollectionView.register(UpcomingCollectionViewCell.self, forCellWithReuseIdentifier: UpcomingCollectionViewCell.reuseId)
    }
    
    func setupUpcomingMatches() {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == homeView.upcomingCollectionView {
            return 20
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == homeView.upcomingCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.reuseId, for: indexPath) as? UpcomingCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    
}
