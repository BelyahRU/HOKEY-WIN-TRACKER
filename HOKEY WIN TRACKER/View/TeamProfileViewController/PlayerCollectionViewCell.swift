
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
    
    let playerNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Midlak Egor"
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    let positionLabel: UILabel = {
        let label = UILabel()
         label.text = "FORWARD- 11"
         label.backgroundColor = .clear
         label.textColor = Resources.Colors.lightBlueColor
         label.font = UIFont.systemFont(ofSize: 14)
         return label
    }()
    
    let dateBirthLabel: UILabel = {
        let label = UILabel()
         label.text = "Date of birth-"
         label.backgroundColor = .clear
         label.textColor = .gray
         label.font = UIFont.systemFont(ofSize: 12)
         return label
    }()
    
    let dateBirth: UILabel = {
        let label = UILabel()
         label.text = "1993-03-28"
         label.backgroundColor = .clear
         label.textColor = .white
         label.font = UIFont.systemFont(ofSize: 12)
         return label
    }()
    
    let heightLabel: UILabel = {
        let label = UILabel()
         label.text = "Height-"
         label.backgroundColor = .clear
         label.textColor = .gray
         label.font = UIFont.systemFont(ofSize: 12)
         return label
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
         label.text = "Weight-"
         label.backgroundColor = .clear
         label.textColor = .gray
         label.font = UIFont.systemFont(ofSize: 12)
         return label
    }()
    
    let membersinceLabel: UILabel = {
        let label = UILabel()
         label.text = "Membersince-"
         label.backgroundColor = .clear
         label.textColor = .gray
         label.font = UIFont.systemFont(ofSize: 12)
         return label
    }()
    
    let height: UILabel = {
        let label = UILabel()
         label.text = "190"
         label.backgroundColor = .clear
         label.textColor = .white
         label.font = UIFont.systemFont(ofSize: 12)
         return label
    }()
    
    let weight: UILabel = {
        let label = UILabel()
         label.text = "82"
         label.backgroundColor = .clear
         label.textColor = .white
         label.font = UIFont.systemFont(ofSize: 12)
         return label
    }()
    
    let membersince: UILabel = {
        let label = UILabel()
         label.text = "1993-03-28"
         label.backgroundColor = .clear
         label.textColor = .white
         label.font = UIFont.systemFont(ofSize: 12)
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
        addSubview(playerNameLabel)
        addSubview(positionLabel)
        addSubview(dateBirthLabel)
        addSubview(dateBirth)
        addSubview(heightLabel)
        addSubview(weightLabel)
        addSubview(membersinceLabel)
        
        addSubview(height)
        addSubview(weight)
        addSubview(membersince)
    }
    
    private func setupConstraints() {
        backgroundRoundedView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        playerNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(33)
            make.top.equalToSuperview().offset(5)
            
        }
        
        positionLabel.snp.makeConstraints { make in
            make.top.equalTo(playerNameLabel.snp.bottom).offset(2)
            make.leading.equalTo(playerNameLabel.snp.leading)
        }
        
        dateBirthLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-5)
            make.leading.equalTo(playerNameLabel.snp.leading)
        }
        
        dateBirth.snp.makeConstraints { make in
            make.centerY.equalTo(dateBirthLabel.snp.centerY)
            make.leading.equalTo(dateBirthLabel.snp.trailing)
        }
        
        heightLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(self.bounds.width / 2 + 30)
            make.top.equalToSuperview().offset(11)
        }
        
        weightLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(self.bounds.width / 2 + 30)
            make.centerY.equalToSuperview()
        }
        
        membersinceLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(self.bounds.width / 2 + 30)
            make.bottom.equalToSuperview().offset(-11)
        }
        
        height.snp.makeConstraints { make in
            make.centerY.equalTo(heightLabel.snp.centerY)
            make.leading.equalTo(heightLabel.snp.trailing)
        }
        
        weight.snp.makeConstraints { make in
            make.centerY.equalTo(weightLabel.snp.centerY)
            make.leading.equalTo(weightLabel.snp.trailing)
        }
        
        membersince.snp.makeConstraints { make in
            make.centerY.equalTo(membersinceLabel.snp.centerY)
            make.leading.equalTo(membersinceLabel.snp.trailing)
        }
        
    }
    
    func setupCell(_ player: Player) {
        height.text = player.height ?? ""
        weight.text = player.weight ?? ""
        membersince.text = DateHelper.formatMembersinceDate(from: player.membersince ?? "") ?? ""
        dateBirth.text = player.birthdate ?? ""
        positionLabel.text = "\(player.position ?? "")- \(player.shirtnumber ?? "")"
        playerNameLabel.text = player.name
    }
        
}
