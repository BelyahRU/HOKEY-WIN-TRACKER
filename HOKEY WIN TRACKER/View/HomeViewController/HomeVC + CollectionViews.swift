
import Foundation
import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupUpcomingCollectionView() {
        homeView.upcomingCollectionView.delegate = self
        homeView.upcomingCollectionView.dataSource = self
        homeView.upcomingCollectionView.showsHorizontalScrollIndicator = false
        homeView.upcomingCollectionView.showsVerticalScrollIndicator = false
        homeView.upcomingCollectionView.register(UpcomingCollectionViewCell.self, forCellWithReuseIdentifier: UpcomingCollectionViewCell.reuseId)
    }
    
    func setupCompletedCollectionView() {
        homeView.completedCollectionView.delegate = self
        homeView.completedCollectionView.dataSource = self
        homeView.completedCollectionView.showsHorizontalScrollIndicator = false
        homeView.completedCollectionView.showsVerticalScrollIndicator = false
        homeView.completedCollectionView.register(CompletedCollectionViewCell.self, forCellWithReuseIdentifier: CompletedCollectionViewCell.reuseId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == homeView.upcomingCollectionView {
            return viewModel.getCountUpcomingItems()
        } else {
            return viewModel.getCountEndedItems()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == homeView.upcomingCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.reuseId, for: indexPath) as? UpcomingCollectionViewCell else {
                
                return UICollectionViewCell()
            }
            let match = viewModel.getUpcomingMatch(by: indexPath.row)
            cell.setupCell(match)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CompletedCollectionViewCell.reuseId, for: indexPath) as? CompletedCollectionViewCell else {
                return UICollectionViewCell()
            }
            let match = viewModel.getEndedMatch(by: indexPath.row)
            cell.isExpanded = cellHeights[indexPath.row]
            cell.setupCell(match)
            

            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView != homeView.upcomingCollectionView {
            let height: CGFloat = cellHeights[indexPath.row] ? 287 : 201
            return CGSize(width: collectionView.frame.width, height: height)
        } else {
            return CGSize(width: 245, height: 101)
        }

    }
    
}
