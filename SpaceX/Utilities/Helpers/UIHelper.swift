//
//  UIHelper.swift
//  SpaceX
//
//  Created by Enes Sancar on 26.05.2023.
//

import UIKit

enum UIHelper {
    
    static func createHomeCompositionLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1 / 7)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = .margin
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
     
    static func attributesLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        let itemWidth = (UIScreen.main.bounds.width / 2) - (.margin * 2)
        let itemHeight = (UIScreen.main.bounds.height / 3) - (2 * CGFloat.margin / 3)
        layout.itemSize = .init(width: itemWidth, height: itemHeight)
        
        layout.minimumLineSpacing = .margin
        layout.minimumInteritemSpacing = .margin / 2
        
        return layout
    }
}

