//
//  CustomButton.swift
//  SpaceX
//
//  Created by Enes Sancar on 28.05.2023.
//

import UIKit

final class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(title: String, backgroundColor: UIColor) {
        self.init(frame: .zero)
        
        setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = .cornerRadius
        titleLabel?.font = .preferredFont(forTextStyle: .title1)
    }
}
