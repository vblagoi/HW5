//
//  ViewController.swift
//  MainAnimations
//
//  Created by Вова Благой on 02.02.2021.
//

import UIKit



class ViewController: UIViewController {

    private var animations: [UIView] = {
        let snow = SnowingView()
        let birth = BirthdayView()
        let firework = FireworkView()
        return [snow, birth, firework]
    }()
    
    
    
    private let animationCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        
        view.addSubview(animationCollectionView)
        
        animationCollectionView.dataSource = self
        animationCollectionView.delegate = self
        animationCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseID)
        
        animationCollectionView.translatesAutoresizingMaskIntoConstraints = false
        animationCollectionView.frame = view.bounds
        
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseID, for: indexPath) as! CollectionViewCell
        cell.cellView = animations[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return view.frame.size
    }
    
}



