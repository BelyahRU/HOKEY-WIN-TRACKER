
import Foundation
import UIKit

class LoadingView: UIView {
    
    let activityIndicator = UIActivityIndicatorView()
    
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Please wait while KHL data is loading."
        label.font =  UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = Resources.Colors.blueColor
        addSubview(activityIndicator)
        addSubview(textLabel)
        
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        textLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(activityIndicator.snp.top).offset(-10)
        }
        activityIndicator.startAnimating()
    }
}
