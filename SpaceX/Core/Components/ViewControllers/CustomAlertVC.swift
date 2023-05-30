//
//  CustomAlertVC.swift
//  SpaceX
//
//  Created by Enes Sancar on 30.05.2023.
//

import UIKit
import SnapKit

final class CustomAlertVC: UIViewController {
    
    //MARK: - Properties
    private var containerView: AlertContainerView!
    private var titleLabel: TitleLabel!
    private var bodyLabel: BodyLabel!
    private var actionButton: CustomButton!
    
    private let alertTitle: String
    private let alertBody: String
    private let alertButtonTitle: String
    
    init(alertTitle: String, alertBody: String, alertButtonTitle: String) {
        self.alertTitle = alertTitle
        self.alertBody = alertBody
        self.alertButtonTitle = alertButtonTitle
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureVC()
        configureContainerView()
        configureTitleLabel()
        configureBodyLabel()
        configureActionButton()
    }
    
    private func configureVC() {
        view.backgroundColor = .black.withAlphaComponent(0.7)
    }
    
    private func configureContainerView() {
        containerView = AlertContainerView(frame: .zero)
        view.addSubview(containerView)
        
        containerView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
        }
    }
    
    private func configureTitleLabel() {
        titleLabel = TitleLabel(text: alertTitle, textAlignment: .center, fontSize: .largeTitle)
        containerView.addArrangedSubview(titleLabel)
    }
    
    private func configureBodyLabel() {
        bodyLabel = BodyLabel(text: alertBody, textAlignment: .center, fontSize: .title1)
        containerView.addArrangedSubview(bodyLabel)
        
        bodyLabel.numberOfLines = 10
    }
    
    private func configureActionButton() {
        actionButton = CustomButton(title: alertButtonTitle, backgroundColor: .systemRed)
        containerView.addArrangedSubview(actionButton)
        
        actionButton.snp.makeConstraints { make in
            make.height.equalTo(containerView.snp.width).multipliedBy(0.15)
        }
        
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
}

extension CustomAlertVC {
    @objc
    private func actionButtonTapped() {
        dismiss(animated: true)
    }
}
