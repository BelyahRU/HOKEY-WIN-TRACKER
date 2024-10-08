
import Foundation
import UIKit

class TeamProfileView: UIView {
    
    let backButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.backButton), for: .normal)
        return button
    }()
    
    private let teamProfilesLabel: UILabel = {
        let label = UILabel()
        label.text = "TEAM PROFILES"
        label.textColor = .white
        label.textAlignment = .left
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    let teamLogo: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: "spartaklog")
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    let teamNameLabel: UILabel = {
       let label = UILabel()
        label.text = "SPARTAK"
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private let teamSeasonLabel: UILabel = {
        let label = UILabel()
         label.text = "TEAM SEASON"
         label.backgroundColor = .clear
         label.numberOfLines = 0
         label.textColor = Resources.Colors.grayColor
         label.font = UIFont.systemFont(ofSize: 16)
         return label
     }()
    
    let teamSeason: UILabel = {
        let label = UILabel()
         label.text = "2024-2025"
         label.backgroundColor = .clear
         label.numberOfLines = 0
        label.textColor = .white
         label.font = UIFont.systemFont(ofSize: 16)
         return label
     }()
    
    private let trainerLabel: UILabel = {
        let label = UILabel()
         label.text = "TRAINER"
         label.backgroundColor = .clear
         label.numberOfLines = 0
         label.textColor = Resources.Colors.grayColor
         label.font = UIFont.systemFont(ofSize: 16)
         return label
     }()
    
    let trainer: UILabel = {
        let label = UILabel()
         label.text = "Alexey Zhamnov"
         label.backgroundColor = .clear
         label.numberOfLines = 0
        label.textColor = .white
         label.font = UIFont.systemFont(ofSize: 16)
         return label
     }()
    
    private let homeStadiumLabel: UILabel = {
        let label = UILabel()
         label.text = "HOME STADIUM"
         label.backgroundColor = .clear
         label.numberOfLines = 0
         label.textColor = Resources.Colors.grayColor
         label.font = UIFont.systemFont(ofSize: 16)
         return label
     }()
    
    let stadium: UILabel = {
        let label = UILabel()
         label.text = "Sport Palace 'Megasport'"
         label.backgroundColor = .clear
         label.numberOfLines = 0
        label.textColor = .white
         label.font = UIFont.systemFont(ofSize: 16)
         return label
     }()
    
    private let separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = .white.withAlphaComponent(0.5)
        return view
    }()
    
    let playersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 28, height: 71)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    private let victoriesLabel: UILabel = {
        let label = UILabel()
         label.text = "VICTORIES"
         label.backgroundColor = .clear
         label.numberOfLines = 0
         label.textColor = Resources.Colors.leadersTextColor
         label.font = UIFont.systemFont(ofSize: 16)
         return label
     }()
    
    let victories: UILabel = {
        let label = UILabel()
         label.text = "26"
         label.backgroundColor = .clear
         label.numberOfLines = 0
         label.textColor = Resources.Colors.leadersTextColor
         label.font = UIFont.systemFont(ofSize: 24)
         return label
     }()
    
    private let defeatsLabel: UILabel = {
        let label = UILabel()
         label.text = "DEFEATS"
         label.backgroundColor = .clear
         label.numberOfLines = 0
         label.textColor = Resources.Colors.outsidersTextColor
         label.font = UIFont.systemFont(ofSize: 16)
         return label
     }()
    
    let defeats: UILabel = {
        let label = UILabel()
         label.text = "2"
         label.backgroundColor = .clear
         label.numberOfLines = 0
         label.textColor = Resources.Colors.outsidersTextColor
         label.font = UIFont.systemFont(ofSize: 24)
         return label
     }()
    
    private let pointsLabel: UILabel = {
        let label = UILabel()
         label.text = "POINTS"
         label.backgroundColor = .clear
         label.numberOfLines = 0
         label.textColor = Resources.Colors.yellowColor
         label.font = UIFont.systemFont(ofSize: 16)
         return label
     }()
    
    let points: UILabel = {
        let label = UILabel()
         label.text = "53.5"
         label.backgroundColor = .clear
         label.numberOfLines = 0
         label.textColor = Resources.Colors.yellowColor
         label.font = UIFont.systemFont(ofSize: 24)
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

    private func setupSubviews() {
        addSubview(backButton)
        addSubview(teamProfilesLabel)
        addSubview(teamLogo)
        addSubview(teamNameLabel)
        addSubview(teamSeasonLabel)
        addSubview(teamSeason)
        addSubview(trainerLabel)
        addSubview(trainer)
        addSubview(homeStadiumLabel)
        addSubview(stadium)
        
        
        addSubview(separatorLine)
        
        addSubview(victoriesLabel)
        addSubview(victories)
        addSubview(defeatsLabel)
        addSubview(defeats)
        addSubview(pointsLabel)
        addSubview(points)
        addSubview(playersCollectionView)
    }

    private func setupConstraints() {
        
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(67)
            make.leading.equalToSuperview().offset(14)
            make.size.equalTo(22)
        }
        
        teamProfilesLabel.snp.makeConstraints { make in
            make.leading.equalTo(backButton.snp.trailing).offset(16)
            make.centerY.equalTo(backButton.snp.centerY)
        }
        
        teamLogo.snp.makeConstraints { make in
            make.width.equalTo(180)
            make.height.equalTo(105)
            make.leading.equalToSuperview().offset(14)
            make.top.equalTo(teamProfilesLabel.snp.bottom).offset(20)
        }
        
        teamNameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(teamLogo.snp.centerX)
            make.top.equalTo(teamLogo.snp.bottom).offset(16)
        }
        
        teamSeasonLabel.snp.makeConstraints { make in
            make.top.equalTo(teamLogo.snp.top)
            make.leading.equalTo(teamLogo.snp.trailing).offset(24)
            make.trailing.equalToSuperview().offset(-35)
        }
        
        teamSeason.snp.makeConstraints { make in
            make.top.equalTo(teamSeasonLabel.snp.bottom)
            make.leading.equalTo(teamLogo.snp.trailing).offset(24)
            make.trailing.equalToSuperview().offset(-35)
        }
        
        trainerLabel.snp.makeConstraints { make in
            make.top.equalTo(teamSeason.snp.bottom).offset(17)
            make.leading.equalTo(teamLogo.snp.trailing).offset(24)
            make.trailing.equalToSuperview().offset(-35)
        }
        
        trainer.snp.makeConstraints { make in
            make.top.equalTo(trainerLabel.snp.bottom)
            make.leading.equalTo(teamLogo.snp.trailing).offset(24)
            make.trailing.equalToSuperview().offset(-35)
        }
        
        homeStadiumLabel.snp.makeConstraints { make in
            make.top.equalTo(trainer.snp.bottom).offset(17)
            make.leading.equalTo(teamLogo.snp.trailing).offset(24)
            make.trailing.equalToSuperview().offset(-35)
        }
        
        stadium.snp.makeConstraints { make in
            make.top.equalTo(homeStadiumLabel.snp.bottom)
            make.leading.equalTo(teamLogo.snp.trailing).offset(24)
            make.trailing.equalToSuperview().offset(-35)
        }
        
        separatorLine.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(48)
            make.trailing.equalToSuperview().offset(-48)
            make.height.equalTo(1)
            make.top.equalToSuperview().offset(300)
        }
        
        defeatsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()  // Центрируем defeatsLabel по горизонтали
            make.top.equalTo(separatorLine.snp.bottom).offset(20)  // Задаем отступ сверху (можно изменить по необходимости)
        }
        
        defeats.snp.makeConstraints { make in
            make.centerX.equalTo(defeatsLabel.snp.centerX)
            make.top.equalTo(defeatsLabel.snp.bottom).offset(10)
        }
        
        pointsLabel.snp.makeConstraints { make in
            make.centerX.equalTo(defeatsLabel.snp.right).offset((UIScreen.main.bounds.width / 4))  // Центр между defeatsLabel и правой частью экрана
            make.centerY.equalTo(defeatsLabel)
        }
        
        points.snp.makeConstraints { make in
            make.centerX.equalTo(pointsLabel.snp.centerX)
            make.top.equalTo(pointsLabel.snp.bottom).offset(10)
        }
        
        victoriesLabel.snp.makeConstraints { make in
            make.centerX.equalTo(defeatsLabel.snp.left).offset(-(UIScreen.main.bounds.width / 4))  // Центр между defeatsLabel и левой частью экрана
            make.centerY.equalTo(defeatsLabel)
        }
        
        victories.snp.makeConstraints { make in
            make.centerX.equalTo(victoriesLabel.snp.centerX)
            make.top.equalTo(victoriesLabel.snp.bottom).offset(10)
        }
        
        playersCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(14)
            make.top.equalTo(victories.snp.bottom).offset(30)
            make.trailing.equalToSuperview().offset(-14)
            make.bottom.equalToSuperview()
        }
        
    }
}
