import Foundation
import UIKit

class TableView: UIView {
    
    private let tournamentTableLabel: UILabel = {
        let label = UILabel()
        label.text = "TOURNAMENT TABLE"
        label.textColor = .white
        label.textAlignment = .left
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    let teamsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 13, right: 0)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 28, height: 68)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
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
        addSubview(tournamentTableLabel)
        addSubview(teamsCollectionView)
    }

    private func setupConstraints() {
        tournamentTableLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(14)
            make.top.equalToSuperview().offset(67)
        }
        
        teamsCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(14)
            make.top.equalTo(tournamentTableLabel.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-14)
            make.bottom.equalToSuperview()
        }
        
    }
}
