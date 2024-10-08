
import Foundation
import UIKit

extension NewsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func setupCollectionView() {
        newsView.newsCollectionView.delegate = self
        newsView.newsCollectionView.dataSource = self
        newsView.newsCollectionView.showsVerticalScrollIndicator = false
        
        newsView.newsCollectionView.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: NewsCollectionViewCell.reuseId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getCountItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.reuseId, for: indexPath) as? NewsCollectionViewCell else {
            return UICollectionViewCell()
        }
        guard let news = viewModel.getNews(by: indexPath.row) else {
            return cell
        }
        
        cell.setupCell(news)
        return cell
    }
}
