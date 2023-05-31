//
//  BaseVC.swift
//  SpaceX
//
//  Created by Enes Sancar on 31.05.2023.
//

import UIKit
import SnapKit

class BaseVC: UIViewController {
    
    private var containerView: UIView!
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor = .black.withAlphaComponent(0)
        
        UIView.animate(withDuration: 0.3) {
            self.containerView.backgroundColor = .black.withAlphaComponent(0.65)
        }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        activityIndicator.color = .white
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        activityIndicator.startAnimating()
    }
    
    func dismissLoadingView() {
        guard containerView != nil else { return }
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3) {
                self.containerView.backgroundColor = .black.withAlphaComponent(0)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.containerView.removeFromSuperview()
            self.containerView = nil
        }
    }
}
