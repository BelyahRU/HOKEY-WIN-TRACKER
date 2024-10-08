import UIKit

class ErrorViewController: UIViewController {
    
    private let retryButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Try again", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .gray
        label.text = "Our server is overloaded, try restarting the application in a minute"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Resources.Colors.blueColor
        view.addSubview(textLabel)
        view.addSubview(retryButton)
        retryButton.addTarget(self, action: #selector(retryButtonTapped), for: .touchUpInside)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        textLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(17)
            make.trailing.equalToSuperview().offset(-17)
        }
        
        retryButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(textLabel.snp.bottom).offset(30)
        }
    }
    
    func configure(with message: String) {
        print(message)
    }
    
    @objc private func retryButtonTapped() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let delegate = windowScene.delegate as? SceneDelegate else {
            return
        }
        delegate.start()
    }
}
