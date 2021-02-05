//
//  SnowingView.swift
//  MainAnimations
//
//  Created by Вова Благой on 04.02.2021.
//

import UIKit

class SnowingView: UIView {
    
    private lazy var gradientLayer: CAGradientLayer = {
        
        let gradientLayer = CAGradientLayer()
        let colorTop: UIColor = #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)
        let colorBottom: UIColor = #colorLiteral(red: 0.6658602953, green: 0.7665301561, blue: 1, alpha: 1)
        gradientLayer.colors = [colorTop.cgColor,
                                colorBottom.cgColor]
        return gradientLayer
        
    }()
    
    private lazy var snowingLayer: CAEmitterLayer = {
        
        let emitter = CAEmitterLayer()
        emitter.emitterShape = CAEmitterLayerEmitterShape.line
        emitter.emitterCells = generateEmitterCells(with: UIImage(named: "snow")!)
        
        return emitter
        
    }()
    
    private func generateEmitterCells(with image: UIImage) -> [CAEmitterCell] {
        
        var cells = [CAEmitterCell]()
        
        let cell = CAEmitterCell()
        cell.contents = image.cgImage
        cell.birthRate = 20
        cell.lifetime = 20
        cell.velocity = CGFloat(100)
        cell.emissionLongitude = (180 * (.pi/180))
        cell.emissionRange = (20 * (.pi / 180))
        cell.scale = 0.23
        cell.scaleRange = 0.2
        
        
        cells.append(cell)
        
        return cells
        
    }
    
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
        snowingLayer.emitterPosition = CGPoint(x: frame.width / 2, y: 0)
        snowingLayer.emitterSize = CGSize(width: frame.width, height: frame.height)
        
    }
    
}

private extension SnowingView {
    
    func commonInit() {
        
        layer.addSublayer(gradientLayer)
        layer.addSublayer(snowingLayer)
        
    }
    
}
