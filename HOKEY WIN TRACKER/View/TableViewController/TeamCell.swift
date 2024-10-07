
import Foundation
import UIKit

class TeamCell: UICollectionViewCell {
    static let identifier = "TeamCell"
    
    private let teamNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.backgroundColor = .clear
        return label
    }()
    
    private let backImage: UIImageView = {
        let im = UIImageView()
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    private let teamLogoImageView: UIImageView = {
         let im = UIImageView()
//         im.image = UIImage(named: "skaLogo")
         im.contentMode = .scaleAspectFit
         return im
     }()
    
    private let victoriesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = Resources.Colors.grayColor
        label.text = "VICTORIES"
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    private let defeatsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = Resources.Colors.grayColor
        label.text = "DEFEATS"
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    private let pointsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = Resources.Colors.grayColor
        label.textAlignment = .center
        label.text = "POINTS"
        label.backgroundColor = .clear
        return label
    }()
    
    private let victories: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .center
//        label.text = "26"
        label.backgroundColor = .clear
        return label
    }()
    
    private let defeats: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .center
//        label.text = "2"
        label.backgroundColor = .clear
        return label
    }()
    
    private let points: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .center
//        label.text = "53.5"
        label.backgroundColor = .clear
        return label
    }()
    
    private let greenHockeyPuck: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: Resources.Images.greenHockeyPuck)
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    private let redHockeyPuck: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: Resources.Images.redHockeyPuck)
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    private let abandonedPucks: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = Resources.Colors.leadersTextColor
        label.textAlignment = .center
//        label.text = "16"
        label.backgroundColor = .clear
        return label
    }()
    
    private let missedPucks: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = Resources.Colors.outsidersTextColor
        label.textAlignment = .center
//        label.text = "3"
        label.backgroundColor = .clear
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        self.contentView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        addSubview(backImage)
        addSubview(teamNumberLabel)
        addSubview(teamLogoImageView)
        addSubview(victoriesLabel)
        addSubview(victories)
        addSubview(defeatsLabel)
        addSubview(defeats)
        addSubview(pointsLabel)
        addSubview(points)
        addSubview(greenHockeyPuck)
        addSubview(redHockeyPuck)
        addSubview(abandonedPucks)
        addSubview(missedPucks)
    }
    
    private func setupConstraints() {
        backImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        teamNumberLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(14)
        }
        
        teamLogoImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(35)
            make.size.equalTo(36)
        }
        
        victoriesLabel.snp.makeConstraints { make in
            make.leading.equalTo(teamLogoImageView.snp.trailing).offset(20)
            make.top.equalTo(teamLogoImageView.snp.top)
        }
        
        victories.snp.makeConstraints { make in
            make.centerX.equalTo(victoriesLabel.snp.centerX)
            make.top.equalTo(victoriesLabel.snp.bottom).offset(5)
        }
        
        defeatsLabel.snp.makeConstraints { make in
            make.leading.equalTo(victoriesLabel.snp.trailing).offset(20)
            make.top.equalTo(teamLogoImageView.snp.top)
        }
        
        defeats.snp.makeConstraints { make in
            make.centerX.equalTo(defeatsLabel.snp.centerX)
            make.top.equalTo(defeatsLabel.snp.bottom).offset(5)
        }
        
        pointsLabel.snp.makeConstraints { make in
            make.leading.equalTo(defeatsLabel.snp.trailing).offset(20)
            make.top.equalTo(teamLogoImageView.snp.top)
        }
        
        points.snp.makeConstraints { make in
            make.centerX.equalTo(pointsLabel.snp.centerX)
            make.top.equalTo(pointsLabel.snp.bottom).offset(5)
        }
        
        greenHockeyPuck.snp.makeConstraints { make in
            make.size.equalTo(16)
            make.top.equalTo(teamLogoImageView.snp.top)
            make.leading.equalTo(pointsLabel.snp.trailing).offset(12)
        }
        
        redHockeyPuck.snp.makeConstraints { make in
            make.size.equalTo(16)
            make.bottom.equalTo(points.snp.bottom)
            make.leading.equalTo(pointsLabel.snp.trailing).offset(12)
        }
        
        abandonedPucks.snp.makeConstraints { make in
            make.centerY.equalTo(greenHockeyPuck.snp.centerY)
            make.leading.equalTo(greenHockeyPuck.snp.trailing).offset(10)
        }
        
        missedPucks.snp.makeConstraints { make in
            make.centerY.equalTo(redHockeyPuck.snp.centerY)
            make.leading.equalTo(redHockeyPuck.snp.trailing).offset(10)
        }
    }
    
    func configure(with team: TeamStanding, section: Int) {
        switch section {
        case 0:
            backImage.image = UIImage(named: Resources.Images.leaderCell)
            teamNumberLabel.text = team.pos
            
        default:
            backImage.image = UIImage(named: Resources.Images.outsiderCell)
            teamNumberLabel.text = team.pos
            
        }
        
        points.text = team.points
        defeats.text = team.loss
        victories.text = team.win
        abandonedPucks.text = team.goalsfor
        missedPucks.text = team.goalsagainst
        print(team.team.imageData)
        teamLogoImageView.image = UIImage(data: team.team.imageData ?? Data())
    }
    
    private func loadImage(from url: URL, into imageView: UIImageView) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    imageView.image = image
                }
            }
        }
    }
}
