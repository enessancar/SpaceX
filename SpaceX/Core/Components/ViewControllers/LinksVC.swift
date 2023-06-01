//
//  LinksVC.swift
//  SpaceX
//
//  Created by Enes Sancar on 31.05.2023.
//

import UIKit
import SnapKit

final class LinksVC: UIViewController {
    
    private let youtubeItemView = LinkItemView(systemName: SFSymbols.youtube, title: "YouTube")
    private let presskitItemView = LinkItemView(systemName: SFSymbols.presskit, title: "PressKit")
    private let articleItemView = LinkItemView(systemName: SFSymbols.article, title: "Article")
    private let wikipediaItemView = LinkItemView(systemName: SFSymbols.wikipedia, title: "Wikipedia")
    
    private let launch: Launch
    
    init(launch: Launch) {
        self.launch = launch
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureItems()
    }
    
    @objc private func youtubeItemPressed() {
        guard
            let urlString = launch.links?.webcast,
            let url = URL(string: urlString) else {
            presentAlert(alertTitle: CustomError.title.rawValue, alertBody: CustomError.noAvailableContent.rawValue, alertButtonTitle: "Ok")
            return
        }
        presentSafariVC(url: url)
    }
    
    @objc private func pressKitPressed() {
        guard
            let urlString = launch.links?.presskit,
            let url = URL(string: urlString) else {
            presentAlert(alertTitle: CustomError.title.rawValue, alertBody: CustomError.noAvailableContent.rawValue, alertButtonTitle: "Ok")
            return
        }
        presentSafariVC(url: url)
    }
    
    @objc private func articlePressed() {
        guard
            let urlString = launch.links?.article,
            let url = URL(string: urlString) else {
            presentAlert(alertTitle: CustomError.title.rawValue, alertBody: CustomError.noAvailableContent.rawValue, alertButtonTitle: "Ok")
            return
        }
        presentSafariVC(url: url)
    }
    
    @objc private func wikipediaPressed() {
        guard
            let urlString = launch.links?.wikipedia,
            let url = URL(string: urlString) else {
            presentAlert(alertTitle: CustomError.title.rawValue, alertBody: CustomError.noAvailableContent.rawValue, alertButtonTitle: "Ok")
            return
        }
        presentSafariVC(url: url)
    }
}

extension LinksVC {
    private func configure() {
        view.backgroundColor = .systemBackground
    }
    
    private func configureItems() {
        view.addSubviews(youtubeItemView, presskitItemView, articleItemView, wikipediaItemView)
        
        for item in [youtubeItemView, presskitItemView, articleItemView, wikipediaItemView] {
            item.snp.makeConstraints { make in
                make.width.equalToSuperview()
                make.height.equalTo(view.frame.size.height * 0.08)
            }
        }
        
        youtubeItemView.snp.makeConstraints({ $0.top.equalToSuperview() })
        presskitItemView.snp.makeConstraints { make in
            make.top.equalTo(youtubeItemView.snp.bottom).offset(CGFloat.margin)
        }
        articleItemView.snp.makeConstraints { make in
            make.top.equalTo(presskitItemView.snp.bottom).offset(CGFloat.margin)
        }
        wikipediaItemView.snp.makeConstraints { make in
            make.top.equalTo(articleItemView.snp.bottom).offset(CGFloat.margin)
        }
        
        youtubeItemView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(youtubeItemPressed)))
        presskitItemView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pressKitPressed)))
        articleItemView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(articlePressed)))
        wikipediaItemView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(wikipediaPressed)))
    }
}
