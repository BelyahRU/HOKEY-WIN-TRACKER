import Foundation
import UIKit

class StatisticsView: UIView {
    
    private let playersStatisticsLabel: UILabel = {
        let label = UILabel()
        label.text = "PLAYERS STATISTICS"
        label.textColor = .white
        label.textAlignment = .left
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private let top10PlayersLabel: UILabel = {
        let label = UILabel()
        label.text = "Top 10 players"
        label.textColor = .white
        label.textAlignment = .left
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()
    
    public let top10PlayersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 28, height: 92)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        setupSubviews()
        setupConstraints()
    }

    private func setupSubviews() {
        addSubview(playersStatisticsLabel)
        addSubview(top10PlayersLabel)
        addSubview(top10PlayersCollectionView)
    }

    private func setupConstraints() {
        playersStatisticsLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(14)
            make.top.equalToSuperview().offset(67)
        }
        
        top10PlayersLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(14)
            make.top.equalTo(playersStatisticsLabel.snp.bottom).offset(20)
        }
        
        top10PlayersCollectionView.snp.makeConstraints { make in
            make.top.equalTo(top10PlayersLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(14)
            make.trailing.equalToSuperview().offset(-14)
            make.bottom.equalToSuperview()
        }
    }
}
