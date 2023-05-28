//
//  UIViewController+Ext.swift
//  SpaceX
//
//  Created by Enes Sancar on 28.05.2023.
//

import UIKit
import SafariServices

extension UIViewController {
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    func presentAlert(alertTitle: String, alertBody: String, alertButtonTitle: String) {
        
    }
    
    func presentSafariVC(url: URL) {
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
}
