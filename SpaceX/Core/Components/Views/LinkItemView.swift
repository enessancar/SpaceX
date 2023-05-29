//
//  LinkItemView.swift
//  SpaceX
//
//  Created by Enes Sancar on 29.05.2023.
//

import UIKit
import SnapKit

final class LinkItemView: UIView {
    
    //MARK: - Properties
    private var imageView: CustomImageView!
    private var titleLabel: TitleLabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(systemName: String, title: String) {
        self.init(frame: .zero)
        
        imageView.image = UIImage(systemName: systemName)
        titleLabel.text = title
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = .cornerRadius
        layer.borderColor = UIColor.systemGray6.cgColor
        layer.borderWidth = .borderWidth
    }
    
    private func configureImageView() {
        imageView = CustomImageView(frame: .zero)
        addSubview(imageView)
        
        imageView.backgroundColor = .clear
        
        imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(2 * CGFloat.padding)
            make.height.width.equalTo(50)
        }
    }
    
    private func configureTitleLabel() {
        titleLabel = TitleLabel(text: "", textAlignment: .left, fontSize: .title2)
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(imageView)
            make.leading.equalTo(imageView.snp.trailing).offset(2 * CGFloat.padding)
        }
    }
}
