
import Foundation
import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "UpcomingCollectionViewCell"
    
    private let backgroundRoundedView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = Resources.Colors.cellsColor
        return view
    }()
    
    let firstTeamImageView: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: "skaLogo")
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    let secondTeamImageView: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: "sochiLogo")
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    let dateLabel: UILabel = {
       let label = UILabel()
        label.text = "24.09"
        label.backgroundColor = .clear
        label.textColor = Resources.Colors.orangeColor
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private let timeBackOrangeView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = Resources.Colors.orangeColor
        return view
    }()
    
    let timeLabel: UILabel = {
       let label = UILabel()
        label.text = "22:20"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.backgroundColor = .clear
        return label
    }()
    
    let stadiumLabel: UILabel = {
       let label = UILabel()
        label.text = "Stadium: 'Татнефть Арена'"
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
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
        addSubview(firstTeamImageView)
        addSubview(secondTeamImageView)
        addSubview(timeBackOrangeView)
        addSubview(timeLabel)
        addSubview(dateLabel)
        addSubview(stadiumLabel)
    }
    
    private func setupConstraints() {
        
        backgroundRoundedView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        firstTeamImageView.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.width.equalTo(30)
            make.leading.equalToSuperview().offset(26)
            make.top.equalToSuperview().offset(10)
        }
        
        secondTeamImageView.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.width.equalTo(30)
            make.leading.equalToSuperview().offset(26)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        timeBackOrangeView.snp.makeConstraints { make in
            make.width.equalTo(43)
            make.height.equalTo(16)
            make.top.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-19)
        }
        self.bringSubviewToFront(timeLabel)
        
        timeLabel.snp.makeConstraints { make in
            make.center.equalTo(timeBackOrangeView.snp.center)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(timeLabel.snp.centerY)
            make.trailing.equalTo(timeLabel.snp.leading).offset(-10)
        }
        
        stadiumLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(46)
            make.leading.equalTo(secondTeamImageView.snp.trailing).offset(20)
            make.width.equalTo(155)
        }
    }
}
