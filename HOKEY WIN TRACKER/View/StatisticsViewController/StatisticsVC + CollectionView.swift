
import Foundation
import UIKit

extension StatisticsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setupCollectionView() {
        statisticsView.top10PlayersCollectionView.dataSource = self
        statisticsView.top10PlayersCollectionView.delegate = self
        statisticsView.top10PlayersCollectionView.register(StatisticsCollectionViewCell.self, forCellWithReuseIdentifier: StatisticsCollectionViewCell.reuseId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StatisticsCollectionViewCell.reuseId, for: indexPath) as? StatisticsCollectionViewCell else {
            return UICollectionViewCell()
        }
        guard let player = viewModel.getPlayer(by: indexPath.row) else {
            return cell
        }
        cell.setupCell(player: player)
        
        return cell
    }
}
