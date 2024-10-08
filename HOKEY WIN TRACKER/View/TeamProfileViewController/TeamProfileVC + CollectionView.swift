
import Foundation
import UIKit

extension TeamProfileViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setupCollectionView() {
        teamProfileView.playersCollectionView.dataSource = self
        teamProfileView.playersCollectionView.delegate = self
        teamProfileView.playersCollectionView.showsVerticalScrollIndicator = false
        
        teamProfileView.playersCollectionView.register(PlayerCollectionViewCell.self, forCellWithReuseIdentifier: PlayerCollectionViewCell.reuseId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getCountPlayers()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerCollectionViewCell.reuseId, for: indexPath) as? PlayerCollectionViewCell else {
            return UICollectionViewCell()
        }
        guard let player = viewModel.getPlayer(by: indexPath.row) else {
            return cell
        }
        cell.setupCell(player)
        return cell
    }
    
    
}
