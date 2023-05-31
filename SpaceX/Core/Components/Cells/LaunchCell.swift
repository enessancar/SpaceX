//
//  LaunchCell.swift
//  SpaceX
//
//  Created by Enes Sancar on 31.05.2023.
//

import UIKit
import SnapKit

final class LaunchCell: UICollectionViewCell {
    static let identifier = "LaunchCell"
    
    //MARK: - Properties
    private var imageView: CustomImageView!
    private var stackView: CustomStackView!
    private var nameLabel: TitleLabel!
    private var dateLabel: BodyLabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
        configureImageView()
        configureStackView()
        configureNameLabel()
        configureDateLabel()
        
        showDisclosureIndicator(size: 24, tintColor: .secondaryLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(launch: Launch) {
        nameLabel.text = launch._name
        dateLabel.text = launch._launchDate
        
        if let urlString = launch.links?.patch?.small {
            imageView.download(urlString: urlString)
        } else {
            imageView.image = Images.noImage
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        nameLabel.text = nil
        dateLabel.text = nil
        imageView.image = nil
        imageView.cancelDownloading()
    }
    
    private func configure() {
        backgroundColor = .white.withAlphaComponent(0.95)
        layer.cornerRadius = .cornerRadius
        
        layer.borderColor = UIColor.systemGray6.cgColor
        layer.borderWidth = .borderWidth
    }
    
    private func configureImageView() {
        imageView = CustomImageView(frame: .zero)
        addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(snp.leading).offset(2 * CGFloat.padding)
            make.width.height.equalTo(snp.height).multipliedBy(0.7)
        }
    }
    
    private func configureStackView() {
        stackView  = CustomStackView(axis: .vertical)
        addSubview(stackView)
        
        stackView.spacing = .padding / 2
        stackView.alignment = .leading
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(imageView.snp.trailing).offset(2 * CGFloat.padding)
            make.trailing.equalTo(snp.trailing).offset(-2 * CGFloat.padding)
        }
    }
    
    private func configureNameLabel() {
        nameLabel = TitleLabel(text: "", textAlignment: .left, fontSize: .title2)
        stackView.addArrangedSubview(nameLabel)
    }
    
    private func configureDateLabel() {
        dateLabel = BodyLabel(text: "", textAlignment: .left, fontSize: .body)
        stackView.addArrangedSubview(dateLabel)
    }
}
