
import Foundation
import UIKit

class StatisticsCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "StatisticsCollectionViewCell"
    
    private let backgroundRoundedView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = Resources.Colors.cellsColor
        return view
    }()
    
    let teamImageView: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: "skaLogo")
        im.contentMode = .scaleAspectFit
        return im
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
        im.image = UIImage(named: Resources.Icons.goalsIcon)
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    private let goalScoredLabel: UILabel = {
       let label = UILabel()
        label.text = "GOALS SCORED:"
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let assistScoredImage: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: Resources.Icons.assistIcon)
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    private let assistScoredLabel: UILabel = {
       let label = UILabel()
        label.text = "ASSIST SCORED:"
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let totalPointsImage: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: Resources.Icons.totalPointsIcon)
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    private let totalPointsLabel: UILabel = {
       let label = UILabel()
        label.text = "TOTAL POINTS:"
        label.backgroundColor = .clear
        label.textColor = .white
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
    
    let totalPoints: UILabel = {
        let label = UILabel()
         label.text = "24.5"
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
        setupSubviews()
        setupConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    private func setupSubviews() {
        addSubview(backgroundRoundedView)
        addSubview(teamImageView)
        addSubview(playerLogoImageView)
        addSubview(playerNameLabel)
        addSubview(goalsScoredImage)
        addSubview(goalScoredLabel)
        addSubview(assistScoredImage)
        addSubview(assistScoredLabel)
        addSubview(totalPointsImage)
        addSubview(totalPointsLabel)
        addSubview(totalGoals)
        addSubview(totalAssists)
        addSubview(totalPoints)
    }
    
    private func setupConstraints() {
        backgroundRoundedView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        teamImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalTo(contentView.snp.leading).offset(150)
            make.width.equalTo(200)
        }
        
        playerLogoImageView.snp.makeConstraints { make in
            make.leading.equalTo(teamImageView.snp.trailing).offset(14)
            make.size.equalTo(42)
            make.top.equalToSuperview().offset(5)
        }
        
        playerNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(playerLogoImageView.snp.centerY)
            make.leading.equalTo(playerLogoImageView.snp.trailing).offset(10)
        }
        
        goalsScoredImage.snp.makeConstraints { make in
            make.top.equalTo(playerLogoImageView.snp.bottom).offset(10)
            make.leading.equalTo(playerLogoImageView.snp.leading).offset(10)
            make.size.equalTo(16)
        }
        
        goalScoredLabel.snp.makeConstraints { make in
            make.centerY.equalTo(goalsScoredImage.snp.centerY)
            make.leading.equalTo(goalsScoredImage.snp.trailing).offset(8)
        }
        
        totalGoals.snp.makeConstraints { make in
            make.centerY.equalTo(goalsScoredImage.snp.centerY)
            make.leading.equalTo(goalScoredLabel.snp.trailing).offset(20)
        }
        
        assistScoredImage.snp.makeConstraints { make in
            make.top.equalTo(goalsScoredImage.snp.bottom).offset(18)
            make.leading.equalTo(goalsScoredImage.snp.leading)
            make.size.equalTo(16)
        }
        
        assistScoredLabel.snp.makeConstraints { make in
            make.centerY.equalTo(assistScoredImage.snp.centerY)
            make.leading.equalTo(assistScoredImage.snp.trailing).offset(8)
        }
        
        totalAssists.snp.makeConstraints { make in
            make.centerY.equalTo(assistScoredImage.snp.centerY)
            make.centerX.equalTo(totalGoals.snp.centerX)
        }
        
        totalPointsImage.snp.makeConstraints { make in
            make.top.equalTo(assistScoredImage.snp.bottom).offset(18)
            make.leading.equalTo(assistScoredImage.snp.leading)
            make.size.equalTo(16)
        }
        
        totalPointsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(totalPointsImage.snp.centerY)
            make.leading.equalTo(totalPointsImage.snp.trailing).offset(8)
        }
        
        totalPoints.snp.makeConstraints { make in
            make.centerY.equalTo(totalPointsImage.snp.centerY)
            make.centerX.equalTo(totalGoals.snp.centerX)
        }
    }
}
