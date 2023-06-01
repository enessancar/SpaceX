//
//  DateComponentView.swift
//  SpaceX
//
//  Created by Enes Sancar on 29.05.2023.
//

import UIKit
import SnapKit

final class DateComponentView: UIView {
    
    //MARK: - Properties
    private var containerStackView: CustomStackView!
    private var componentStackView: CustomStackView!
    private var valueLabel: TitleLabel!
    private var componentLabel: BodyLabel!
    private var colonLabel: TitleLabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        configureContainerStackView()
        configureComponentStackView()
        configureValueLabel()
        configureComponentLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(component: String, showColon: Bool = false) {
        self.init(frame: .zero)
        
        componentLabel.text = component
        
        guard showColon else { return }
        configureColonLabel()
    }
    
    func setup(value: String) {
        valueLabel.text = value
    }
}

extension DateComponentView {
    private func configureContainerStackView() {
        containerStackView = CustomStackView(axis: .horizontal)
        addSubview(containerStackView)
        
        containerStackView.spacing = 8
        containerStackView.alignment = .top
        
        containerStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configureComponentStackView() {
        componentStackView = CustomStackView(axis: .vertical)
        containerStackView.addArrangedSubview(componentStackView)
        
        componentStackView.spacing = 0
        componentStackView.alignment = .leading
    }
    
    private func configureValueLabel() {
        valueLabel = TitleLabel(text: "", textAlignment: .left, fontSize: .caption1)
        componentStackView.addArrangedSubview(componentLabel)
        
        valueLabel.textColor = .white
    }
    
    private func configureComponentLabel() {
        componentLabel = BodyLabel(text: "", textAlignment: .left, fontSize: .caption1)
        componentStackView.addArrangedSubview(componentLabel)
        
        componentLabel.textColor = .white
    }
    
    private func configureColonLabel() {
        colonLabel = TitleLabel(text: ":", textAlignment: .left, fontSize: .title1)
        containerStackView.addArrangedSubview(colonLabel)
        
        colonLabel.textColor = .white
    }
}
