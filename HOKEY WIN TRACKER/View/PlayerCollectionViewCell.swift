
import Foundation
import UIKit

class PlayerCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "PlayerCollectionViewCell"
    
    private let backgroundRoundedView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = Resources.Colors.cellsColor
        return view
    }()
    
    let playerLogoImageView: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: "midak")
        im.contentMode = .scaleAspectFit
        im.layer.cornerRadius = im.frame.size.width / 2
        im.layer.masksToBounds = true
        return im
    }()
    
    
    let playerNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Midlak Egor"
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let goalsScoredImage: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: Resources.Icons.goalsIcon)?.withTintColor(.white.withAlphaComponent(0.5))
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    private let goalScoredLabel: UILabel = {
       let label = UILabel()
        label.text = "GOALS SCORED:"
        label.backgroundColor = .clear
        label.textColor = .white.withAlphaComponent(0.5)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let assistScoredImage: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: Resources.Icons.assistIcon)?.withTintColor(.white.withAlphaComponent(0.5))
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    private let assistScoredLabel: UILabel = {
       let label = UILabel()
        label.text = "ASSIST SCORED:"
        label.backgroundColor = .clear
        label.textColor = .white.withAlphaComponent(0.5)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let totalGoals: UILabel = {
        let label = UILabel()
         label.text = "4"
         label.backgroundColor = .clear
         label.textColor = .white
         label.font = UIFont.systemFont(ofSize: 18)
         return label
    }()
    
    let totalAssists: UILabel = {
        let label = UILabel()
         label.text = "16"
         label.backgroundColor = .clear
         label.textColor = .white
         label.font = UIFont.systemFont(ofSize: 18)
         return label
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private func setupUI() {
        
    }
    
    private func setupSubviews() {
        addSubview(backgroundRoundedView)
        addSubview(playerLogoImageView)
        addSubview(playerNameLabel)
        addSubview(goalsScoredImage)
        addSubview(goalScoredLabel)
        addSubview(assistScoredImage)
        addSubview(assistScoredLabel)
        addSubview(totalGoals)
        addSubview(totalAssists)
    }
    
    private func setupConstraints() {
        backgroundRoundedView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        playerLogoImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.size.equalTo(51)
            make.leading.equalToSuperview().offset(14)
        }
        
        playerNameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(playerLogoImageView.snp.trailing).offset(10)
            make.width.equalTo(93)
        }
        
        goalsScoredImage.snp.makeConstraints { make in
            make.size.equalTo(16)
            make.top.equalToSuperview().offset(14)
            make.leading.equalTo(playerNameLabel.snp.trailing)
        }
        
        goalScoredLabel.snp.makeConstraints { make in
            make.leading.equalTo(goalsScoredImage.snp.trailing).offset(8)
            make.centerY.equalTo(goalsScoredImage.snp.centerY)
        }
        
        totalGoals.snp.makeConstraints { make in
            make.centerY.equalTo(goalsScoredImage.snp.centerY)
            make.trailing.equalToSuperview().offset(-24)
        }
        
        assistScoredImage.snp.makeConstraints { make in
            make.size.equalTo(16)
            make.bottom.equalToSuperview().offset(-14)
            make.leading.equalTo(playerNameLabel.snp.trailing)
        }
        
        assistScoredLabel.snp.makeConstraints { make in
            make.leading.equalTo(assistScoredImage.snp.trailing).offset(8)
            make.centerY.equalTo(assistScoredImage.snp.centerY)
        }
        
        totalAssists.snp.makeConstraints { make in
            make.centerY.equalTo(assistScoredImage.snp.centerY)
            make.centerX.equalTo(totalGoals.snp.centerX)
        }
        
    }
        
}
