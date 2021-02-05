//
//  CollectionViewCell.swift
//  MainAnimations
//
//  Created by Вова Благой on 05.02.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let reuseID = "CollectionViewCell"
    
    var cellView: UIView = UIView() {
        didSet {
            addSubview(cellView)
            cellView.frame = bounds
            layer.masksToBounds = true
        }
    }
    
}
