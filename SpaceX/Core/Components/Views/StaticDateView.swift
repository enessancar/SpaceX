//
//  StaticDateView.swift
//  SpaceX
//
//  Created by Enes Sancar on 29.05.2023.
//

import UIKit
import SnapKit

final class StaticDateView: UIView {
    
    private struct Constant {
        static let launchDate = "LAUNCH DATE"
    }
    
    //MARK: - Properties
    private var stackView: CustomStackView!
    private var titleLabel: TitleLabel!
    private var dateLabel: BodyLabel!
    
    private let launch: Launch!
    init(launch: Launch) {
        self.launch = launch
        super.init(frame: .zero)
        
        configureStackView()
        configureTitleLabel()
        configureDateLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStackView() {
        stackView = CustomStackView(axis: .vertical)
        addSubview(stackView)
        
        stackView.spacing = 0
        stackView.alignment = .leading
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configureTitleLabel() {
        titleLabel = TitleLabel(text: Constant.launchDate, textAlignment: .left, fontSize: .body)
        stackView.addArrangedSubview(titleLabel)
        titleLabel.textColor = .white
    }
    
    private func configureDateLabel() {
        dateLabel = BodyLabel(text: launch._launchDate, textAlignment: .left, fontSize: .caption1)
        stackView.addArrangedSubview(dateLabel)
        dateLabel.textColor = .white
    }
}

