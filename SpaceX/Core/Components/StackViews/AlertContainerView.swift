//
//  AlertContainerView.swift
//  SpaceX
//
//  Created by Enes Sancar on 29.05.2023.
//

import UIKit

final class AlertContainerView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        let margin = CGFloat.margin * 2
        
        axis = .vertical
        spacing = 2 * .padding
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: margin, left: margin, bottom: margin, right: margin)
        backgroundColor = UIColor(white: 1, alpha: 0.95)
        layer.cornerRadius = .cornerRadius
    }
}
