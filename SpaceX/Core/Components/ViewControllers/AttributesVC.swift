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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createHomeCompositionLayout())
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.register(AttributeCell.self, forCellWithReuseIdentifier: AttributeCell.identifier)
        collectionView.isUserInteractionEnabled = false
        
        collectionView.backgroundColor = .white.withAlphaComponent(0.95)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension AttributesVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AttributeCell.identifier, for: indexPath) as? AttributeCell else {
            fatalError()
        }
        let attribute = launch._attributeNames[indexPath.item]
        let value = launch._attributeValues[indexPath.item]
        cell.setup(attribute: attribute, value: value)
        return cell
    }
}
