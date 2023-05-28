//
//  UIView+Ext.swift
//  SpaceX
//
//  Created by Enes Sancar on 28.05.2023.
//

import UIKit
import SnapKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    
    func showDisclosureIndicator(size: CGFloat, tintColor: UIColor?) {
        let disclosureIndicator = UIImageView(image: UIImage(systemName: "chevron.right"))
        addSubview(disclosureIndicator)
        
        disclosureIndicator.translatesAutoresizingMaskIntoConstraints = false
        disclosureIndicator.contentMode = .scaleAspectFit
        disclosureIndicator.tintColor = tintColor
        
        disclosureIndicator.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-2 * CGFloat.padding)
            make.width.height.equalTo(size)
        }
    }
}
