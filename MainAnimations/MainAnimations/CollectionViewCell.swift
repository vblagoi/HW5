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
            /*
             Not a mistake in this case, but in general you should remove the previous view
             that was added to this reusable cell.
             */
            addSubview(cellView)
            cellView.frame = bounds
            layer.masksToBounds = true
        }
    }
    
}
