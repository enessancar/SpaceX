//
//  PastLaunchDateView.swift
//  SpaceX
//
//  Created by Enes Sancar on 30.05.2023.
//

import UIKit
import SnapKit

final class PastLaunchDateView: UIView {
    
    private struct Constant {
        static let launchDate = "Launch Date:"
    }
    
    private var prefixLabel: BodyLabel!
    private var dateLabel: TitleLabel!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        configurePrefixLabel()
        configureDateLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(launch: Launch) {
        dateLabel.text = launch._launchDate
    }
    
    private func configurePrefixLabel() {
        prefixLabel = BodyLabel(text: Constant.launchDate, textAlignment: .left, fontSize: .title2)
        addSubview(prefixLabel)
        
        prefixLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top)
            make.leading.equalTo(snp.leading)
            make.bottom.equalTo(snp.bottom)
            make.width.equalTo(100)
        }
    }
    
    private func configureDateLabel() {
        dateLabel = TitleLabel(text: "", textAlignment: .left, fontSize: .title2)
        addSubview(dateLabel)
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top)
            make.leading.equalTo(prefixLabel.snp.trailing).offset(4)
            make.bottom.equalTo(snp.bottom)
            make.trailing.equalTo(snp.trailing)
        }
    }
}
