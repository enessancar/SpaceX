//
//  CustomStackView.swift
//  SpaceX
//
//  Created by Enes Sancar on 29.05.2023.
//

import UIKit

final class CustomStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(axis: NSLayoutConstraint.Axis) {
        self.init(frame: .zero)
        self.axis = axis
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        axis = .vertical
        spacing = 3 * .padding
        distribution = .fill
        alignment = .center
    }
}
