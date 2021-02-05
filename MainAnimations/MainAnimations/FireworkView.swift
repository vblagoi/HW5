//
//  FireworkView.swift
//  MainAnimations
//
//  Created by Вова Благой on 05.02.2021.
//

import UIKit

class FireworkView: UIView {

    private var __isAnimating: Bool = true
    
    private lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        let colorTop: UIColor = .black
        let colorBottom: UIColor = .blue
        gradientLayer.colors = [colorTop.cgColor,
                                colorBottom.cgColor]
        return gradientLayer
    }()
    
    private lazy var seattleLayer: CALayer = {
        
        let seattleLayer = CALayer()
        let seattleImage = UIImage(named: "seattle")?.cgImage
        seattleLayer.contents = seattleImage
        return seattleLayer
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        gradientLayer.frame = bounds
        seattleLayer.frame = CGRect(x: 0, y: layer.frame.height - 300, width: layer.frame.width, height: 300)
        
    }

}

private extension FireworkView {
    
    func commonInit() {
        
        layer.addSublayer(gradientLayer)
        layer.addSublayer(seattleLayer)
    }
    
}
