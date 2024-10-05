
import Foundation
import UIKit

class CompletedCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "CompletedCollectionViewCell"
    
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
        
    }
    
    private func setupSubviews() {
        
    }
    
    private func setupConstraints() {
        
    }
}
