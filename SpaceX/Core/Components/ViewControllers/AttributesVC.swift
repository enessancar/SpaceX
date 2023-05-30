//
//  AttributesVC.swift
//  SpaceX
//
//  Created by Enes Sancar on 30.05.2023.
//

import UIKit
import SnapKit

final class AttributesVC: UIViewController {
    
    private var collectionView: UICollectionView!
    private let launch: Launch
    
    init(launch: Launch) {
        self.launch = launch
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createHomeCompositionLayout())
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        //collectionView.dataSource = self
        //collectionView
    }
}
