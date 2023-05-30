//
//  LaunchHeaderView.swift
//  SpaceX
//
//  Created by Enes Sancar on 30.05.2023.
//

import UIKit
import SnapKit

final class LaunchHeaderView: UIView {
    
    private var imageView: CustomImageView!
    private var launchName: TitleLabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        configureImageView()
        configureLaunchName()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(launch: Launch) {
        launchName.text = launch._name
        
        if let urlString = launch.links?.patch?.small {
            imageView.download(urlString: urlString)
        } else {
            imageView.image = Images.noImage
        }
    }
    
    private func configureImageView() {
        imageView = CustomImageView(frame: .zero)
        addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading)
            make.top.equalTo(snp.top)
            make.bottom.equalTo(snp.bottom)
            make.height.equalTo(imageView.snp.width)
        }
    }
    
    private func configureLaunchName() {
        launchName = TitleLabel(text: "", textAlignment: .left, fontSize: .largeTitle)
        addSubview(launchName)
        
        launchName.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(2 * CGFloat.padding)
            make.trailing.equalTo(snp.trailing)
            make.centerY.equalTo(snp.centerY)
        }
    }
}
