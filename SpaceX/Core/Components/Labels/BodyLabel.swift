//
//  BodyLabel.swift
//  SpaceX
//
//  Created by Enes Sancar on 29.05.2023.
//

import UIKit

final class BodyLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String, textAlignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
              
        self.text = text
        self.textAlignment = textAlignment
        self.font = .systemFont(ofSize: fontSize)
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        numberOfLines = 0
        textColor = .secondaryLabel
        
        adjustsFontForContentSizeCategory = true
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        
        lineBreakMode = .byTruncatingTail
    }
}
