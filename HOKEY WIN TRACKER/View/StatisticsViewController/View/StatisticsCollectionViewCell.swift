
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
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    let teamNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Spartak"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    
    
    let playerNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Midlak Egor"
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
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
    
    private let penaltyScoredImage: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: Resources.Icons.assistIcon)
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    private let penaltyScoredLabel: UILabel = {
       let label = UILabel()
        label.text = "PENALTY SCORED:"
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
    
    let totalPenalties: UILabel = {
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
        addSubview(playerNameLabel)
        addSubview(goalsScoredImage)
        addSubview(goalScoredLabel)
        addSubview(penaltyScoredImage)
        addSubview(penaltyScoredLabel)
        addSubview(totalPointsImage)
        addSubview(totalPointsLabel)
        addSubview(totalGoals)
        addSubview(totalPenalties)
        addSubview(totalPoints)
        addSubview(teamNameLabel)
    }
    
    private func setupConstraints() {
        backgroundRoundedView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        playerNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(19)
        }
        
        teamImageView.snp.makeConstraints { make in
            make.top.equalTo(playerNameLabel.snp.bottom).offset(7)
            make.leading.equalTo(playerNameLabel.snp.leading)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        
        goalsScoredImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(self.bounds.width/2)
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
        
        penaltyScoredImage.snp.makeConstraints { make in
            make.top.equalTo(goalsScoredImage.snp.bottom).offset(10)
            make.leading.equalTo(goalsScoredImage.snp.leading)
            make.size.equalTo(16)
        }
        
        penaltyScoredLabel.snp.makeConstraints { make in
            make.centerY.equalTo(penaltyScoredImage.snp.centerY)
            make.leading.equalTo(penaltyScoredImage.snp.trailing).offset(8)
        }
        
        totalPenalties.snp.makeConstraints { make in
            make.centerY.equalTo(penaltyScoredImage.snp.centerY)
            make.centerX.equalTo(totalGoals.snp.centerX)
        }
        
        totalPointsImage.snp.makeConstraints { make in
            make.top.equalTo(penaltyScoredImage.snp.bottom).offset(10)
            make.leading.equalTo(penaltyScoredImage.snp.leading)
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
        
        teamNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(teamImageView.snp.centerY)
            make.leading.equalTo(teamImageView.snp.trailing).offset(5)
            make.width.equalTo(90)
        }
    }
    
    func setupCell(player: TopPlayer) {
        playerNameLabel.text = player.player.name
        totalPenalties.text = player.penalties
        totalGoals.text = player.goals
        totalPoints.text = player.goal_points
        
        teamImageView.image = UIImage(data: player.teamImage ?? Data())
        teamNameLabel.text = player.team.name
    }
}
