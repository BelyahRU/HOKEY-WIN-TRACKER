
import Foundation
import UIKit

class CompletedCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "CompletedCollectionViewCell"
    
    private let backgroundRoundedView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = Resources.Colors.cellsColor
        return view
    }()
    
    let firstTeamImageView: UIImageView = {
        let im = UIImageView()
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    let secondTeamImageView: UIImageView = {
        let im = UIImageView()
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    let dateLabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white.withAlphaComponent(0.5)
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let firstTeamNameLabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let secondTeamNameLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let finalScoreLabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        return label
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = Resources.Colors.lightBlueColor
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
     }()
    
    var isExpanded = false

    let moreDetailsButton: UIButton = {
        let button = UIButton(type: .system)
        let titleText = "MORE DETAILS "
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "chevron.down")?.withTintColor(.systemBlue)
        let fullString = NSMutableAttributedString(string: titleText)
        fullString.append(NSAttributedString(attachment: imageAttachment))
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        button.setAttributedTitle(fullString, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
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
        moreDetailsButton.addTarget(self, action: #selector(handleMoreDetailsTapped), for: .touchUpInside)
    }
    
    private func setupSubviews() {
        addSubview(backgroundRoundedView)
        addSubview(firstTeamImageView)
        addSubview(secondTeamImageView)
        addSubview(firstTeamNameLabel)
        addSubview(secondTeamNameLabel)
        addSubview(dateLabel)
        addSubview(finalScoreLabel)
        addSubview(infoLabel)
        addSubview(moreDetailsButton)
    }
    
    private func setupConstraints() {
        backgroundRoundedView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        firstTeamImageView.snp.makeConstraints { make in
            make.size.equalTo(66)
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(33)
        }
        
        secondTeamImageView.snp.makeConstraints { make in
            make.size.equalTo(66)
            make.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-33)
        }
        
        firstTeamNameLabel.snp.makeConstraints { make in
            make.top.equalTo(firstTeamImageView.snp.bottom)
            make.centerX.equalTo(firstTeamImageView.snp.centerX)
            make.width.equalTo(120)
        }
        
        secondTeamNameLabel.snp.makeConstraints { make in
            make.top.equalTo(secondTeamImageView.snp.bottom)
            make.centerX.equalTo(secondTeamImageView.snp.centerX)
            make.width.equalTo(120)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(secondTeamImageView.snp.top)
            make.centerX.equalToSuperview()
        }
        
        finalScoreLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(7)
            make.centerX.equalToSuperview()
        }
        if firstTeamNameLabel.center.y > secondTeamNameLabel.center.y {
            infoLabel.snp.makeConstraints { make in
                make.top.equalTo(firstTeamImageView.snp.bottom).offset(20)
                make.trailing.equalToSuperview().offset(-33)
                make.leading.equalToSuperview().offset(33)
                make.centerX.equalToSuperview()
            }
        } else {
            infoLabel.snp.makeConstraints { make in
                make.top.equalTo(secondTeamNameLabel.snp.bottom).offset(20)
                make.trailing.equalToSuperview().offset(-33)
                make.leading.equalToSuperview().offset(33)
                make.centerX.equalToSuperview()
            }
        }
        
        moreDetailsButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
        }
    }
    
    @objc private func handleMoreDetailsTapped() {
        isExpanded.toggle()
        moreDetailsButton.isHidden = true
        let newIcon = isExpanded ? UIImage(systemName: "chevron.up")?.withTintColor(.systemBlue) : UIImage(systemName: "chevron.down")?.withTintColor(.systemBlue)
        let titleText = isExpanded ? "COLLAPSE " : "MORE DETAILS "
        let fullString = NSMutableAttributedString(string: titleText)
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = newIcon
        fullString.append(NSAttributedString(attachment: imageAttachment))
        
        moreDetailsButton.setAttributedTitle(fullString, for: .normal)
        moreDetailsButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        moreDetailsButton.isHidden = false
        NotificationCenter.default.post(name: NSNotification.Name("cellExpansionChanged"), object: nil, userInfo: ["cell": self])
    }
    
    public func setupCell(_ match: EndedMatch) {
        firstTeamImageView.image = UIImage(data: match.firstTeamImage ?? Data())
        secondTeamImageView.image = UIImage(data: match.secondTeamImage ?? Data())
        finalScoreLabel.text = match.ss ?? "0-0"
        firstTeamNameLabel.text = match.home.name
        secondTeamNameLabel.text = match.away.name
        dateLabel.text = DateHelper.formatUnixTime(match.time) ?? ""
    }
}
