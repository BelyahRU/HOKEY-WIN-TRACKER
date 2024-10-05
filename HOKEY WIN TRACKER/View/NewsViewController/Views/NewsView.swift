import Foundation
import UIKit

class NewsView: UIView {
    
    private let newsFeedLabel: UILabel = {
        let label = UILabel()
        label.text = "NEWS FEED"
        label.textColor = .white
        label.textAlignment = .left
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    public let newsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 28, height: 119)
        layout.minimumLineSpacing = 32
        layout.minimumInteritemSpacing = 32
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
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
        addSubview(newsFeedLabel)
        addSubview(newsCollectionView)
    }

    private func setupConstraints() {
        newsFeedLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(14)
            make.top.equalToSuperview().offset(67)
        }
        
        newsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(newsFeedLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(14)
            make.trailing.equalToSuperview().offset(-14)
            make.bottom.equalToSuperview()
        }
    }
}
