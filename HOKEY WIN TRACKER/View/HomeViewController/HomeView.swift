
import Foundation
import UIKit

class HomeView: UIView {
    
    private let khlLabel: UILabel = {
        let label = UILabel()
        label.text = "KHL WIN TRACKER"
        label.font =  UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private let khlLogoImageView: UIImageView = {
       let im = UIImageView()
        im.image = UIImage(named: Resources.Images.khlLogo)
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    public let reloadButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.reloadButton), for: .normal)
        return button
    }()
    
    public let filterButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.filterButton), for: .normal)
        return button
    }()
    
    private let upcomingMatchesLabel: UILabel = {
        let label = UILabel()
        label.text = "Upcoming matches"
        label.font =  UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        return label
    }()
    
    public let upcomingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 245, height: 101)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private let completedMatchesLabel: UILabel = {
        let label = UILabel()
        label.text = "Completed matches"
        label.font =  UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        return label
    }()
    
    public let completedCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 28, height: 209)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
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
        setupUI()
        setupSubviews()
        setupConstraints()
    }
    
    private func setupUI() {
        self.backgroundColor = .black
    }
    
    private func setupSubviews() {
        addSubview(khlLabel)
        addSubview(khlLogoImageView)
        addSubview(reloadButton)
        addSubview(filterButton)
        addSubview(upcomingMatchesLabel)
        addSubview(upcomingCollectionView)
        addSubview(completedMatchesLabel)
        addSubview(completedCollectionView)
    }
    
    private func setupConstraints() {
        khlLogoImageView.snp.makeConstraints { make in
            make.size.equalTo(20)
            make.top.equalToSuperview().offset(71)
            make.leading.equalToSuperview().offset(14)
        }
        
        khlLabel.snp.makeConstraints { make in
            make.centerY.equalTo(khlLogoImageView.snp.centerY)
            make.leading.equalTo(khlLogoImageView.snp.trailing).offset(5)
        }
        
        filterButton.snp.makeConstraints { make in
            make.size.equalTo(26)
            make.trailing.equalToSuperview().offset(-14)
            make.centerY.equalTo(khlLogoImageView.snp.centerY)
        }
        
        reloadButton.snp.makeConstraints { make in
            make.size.equalTo(26)
            make.trailing.equalTo(filterButton.snp.leading).offset(-16)
            make.centerY.equalTo(khlLogoImageView.snp.centerY)
        }
        
        upcomingMatchesLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(14)
            make.top.equalTo(khlLogoImageView.snp.bottom).offset(24)
        }
        
        upcomingCollectionView.snp.makeConstraints { make in
            make.top.equalTo(upcomingMatchesLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(14)
            make.height.equalTo(101)
            make.trailing.equalToSuperview()
        }
        
        completedMatchesLabel.snp.makeConstraints { make in
            make.top.equalTo(upcomingCollectionView.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(14)
        }
        
        completedCollectionView.snp.makeConstraints { make in
            make.top.equalTo(completedMatchesLabel.snp.bottom).offset(10)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(14)
            make.trailing.equalToSuperview().offset(-14)
        }
    }
}
