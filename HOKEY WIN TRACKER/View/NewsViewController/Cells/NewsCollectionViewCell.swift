
import Foundation
import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "NewsCollectionViewCell"
    
    let imageView: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: "newsPhoto")
        im.contentMode = .scaleAspectFit
        return im
    }()
    
    
    let newsTitleLabel: UILabel = {
       let label = UILabel()
        label.text = "News Title"
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()
    
    let infoLabel: UILabel = {
       let label = UILabel()
        label.text = "News text will be here news text will be here news text will be here news text will be here news text will be here"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = Resources.Colors.lightBlueColor
        label.numberOfLines = 0
        label.backgroundColor = .clear
        return label
    }()
    
    let shareButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.shareButton), for: .normal)
        return button
    }()
    
    private let separatorLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
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
        addSubview(imageView)
        addSubview(newsTitleLabel)
        addSubview(infoLabel)
        addSubview(shareButton)
        addSubview(separatorLineView)
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.width.equalTo(140)
        }
        
        shareButton.snp.makeConstraints { make in
            make.size.equalTo(21)
            make.top.trailing.equalToSuperview()
        }
        
        newsTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(imageView.snp.trailing).offset(16)
            make.trailing.equalTo(shareButton.snp.leading).offset(-10)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.leading.equalTo(newsTitleLabel.snp.leading)
            make.top.equalTo(newsTitleLabel.snp.bottom).offset(6)
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-5)
        }
        
        separatorLineView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.bottom).offset(15.35)
            make.width.equalTo(contentView.bounds.width - 68)
            make.height.equalTo(1.3)
            make.centerX.equalToSuperview()
        }
    }
}
