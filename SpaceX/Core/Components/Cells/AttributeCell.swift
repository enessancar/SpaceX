//
//  AttributeCell.swift
//  SpaceX
//
//  Created by Enes Sancar on 30.05.2023.
//

import UIKit
import SnapKit

final class AttributeCell: UICollectionViewCell {
    static let identifier = "AttributeCell"
    
    //MARK: - Properties
    private var stackView: CustomStackView!
    private var attributeLabel: BodyLabel!
    private var valueLabel: TitleLabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        configureStackView()
        configureAttributesLabel()
        configureValuelabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(attribute: String, value: String) {
        attributeLabel.text = attribute
        valueLabel.text = value
    }
    
    private func configure() {
        layer.cornerRadius = .cornerRadius
        
        layer.borderColor = UIColor.systemGray6.cgColor
        layer.borderWidth = .borderWidth
    }
    
    private func configureStackView() {
        stackView = CustomStackView(axis: .vertical)
        addSubview(stackView)
        
        stackView.spacing = 0
        stackView.alignment = .leading
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    private func configureAttributesLabel() {
        attributeLabel = BodyLabel(text: "", textAlignment: .left, fontSize: .body)
        stackView.addArrangedSubview(attributeLabel)
    }
    
    private func configureValuelabel() {
        valueLabel = TitleLabel(text: "True", textAlignment: .left, fontSize: .title2)
        stackView.addArrangedSubview(valueLabel)
    }
}
