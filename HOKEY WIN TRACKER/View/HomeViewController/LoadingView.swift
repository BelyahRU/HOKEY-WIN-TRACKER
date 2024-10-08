
import Foundation
import UIKit

class LoadingView: UIView {
    
    
    private let logoImage: UIImageView = {
       let im = UIImageView()
        im.contentMode = .scaleAspectFit
        im.image = UIImage(named: "loadingLogo")
        return im
    }()
    
    public var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressTintColor = .white
        progressView.layer.cornerRadius = 2
        progressView.layer.masksToBounds = true
        progressView.trackTintColor = .clear
        progressView.backgroundColor = .gray
        progressView.setProgress(0.0, animated: false)
        return progressView
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Please wait while KHL data is loading".uppercased()
        label.font =  UIFont.systemFont(ofSize: 12)
        label.textColor = .white.withAlphaComponent(0.66)
        return label
    }()
    
    private var timer: Timer?
    private var timerCounter: Float = 3
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLoading()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = Resources.Colors.blueColor
        addSubview(textLabel)
        addSubview(logoImage)
        addSubview(progressView)
        
        logoImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(193)
            make.height.equalTo(220)
            make.top.equalToSuperview().offset(200)
        }
        
        progressView.snp.makeConstraints { make in
            make.width.equalTo(283)
            make.height.equalTo(4)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-120)
        }
        
        textLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(progressView.snp.bottom).offset(40)
        }
        
    }
    
    public func setupLoading() {
        timerCounter = 3
        progressView.layoutIfNeeded()
        progressView.setProgress(0, animated: false)
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            self.timerCounter += 0.2
            if self.timerCounter >= 3{
                timer.invalidate()
            }
            let progress = self.timerCounter
            self.progressView.setProgress(progress, animated: true)
        }
    }
}
