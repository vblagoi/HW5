//
//  BirthdayView.swift
//  MainAnimations
//
//  Created by Вова Благой on 04.02.2021.
//

import UIKit

class BirthdayView: UIView {
    
    private var __isAnimating: Bool = true
    
    private lazy var congratulationsLayer: CATextLayer = {
        
        let congratulationsLayer = CATextLayer()
        congratulationsLayer.string = "Happy Birthday!"
        congratulationsLayer.foregroundColor = UIColor.blue.cgColor
        
        return congratulationsLayer
        
    }()
    
    private lazy var cakeLayer: CALayer = {
        
        let cakeLayer = CALayer()
        let cakeImage = UIImage(named: "birthday-cake")?.cgImage
        cakeLayer.contents = cakeImage
        return cakeLayer
        
    }()
    
    private lazy var gradientLayer: CAGradientLayer = {
        
        let gradientLayer = CAGradientLayer()
        let colorTop: UIColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        let colorBottom: UIColor = #colorLiteral(red: 0.7041884065, green: 0.9279029965, blue: 0.909419477, alpha: 1)
        gradientLayer.colors = [colorTop.cgColor,
                                colorBottom.cgColor]
        return gradientLayer
        
    }()
    
    private lazy var confettiLayer: CAEmitterLayer = {
        
        let confettiLayer = CAEmitterLayer()
        confettiLayer.emitterShape = CAEmitterLayerEmitterShape.line
        
        let red = makeConfettiCell(with: UIColor.red)
        let green = makeConfettiCell(with: UIColor.green)
        let blue = makeConfettiCell(with: UIColor.blue)
        
        confettiLayer.emitterCells = [red, green, blue]

        return confettiLayer
        
    }()
    
    private func makeConfettiCell(with color: UIColor) -> CAEmitterCell {
        let cell = CAEmitterCell()
        
        cell.color = color.cgColor
        
        cell.contents = UIImage(named: "confetti")?.cgImage
        cell.birthRate = 2
        cell.lifetime = 20
        cell.velocity = CGFloat(100)
        cell.emissionLongitude = (180 * (.pi/180))
        cell.emissionRange = (30 * (.pi / 180))
        cell.scale = 0.6
        cell.scaleRange = 0.4
        cell.spin = 3.5
        
        return cell
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
        let cakeSize = CGSize(width: 223, height: 261)
        let cakeOrigin = CGPoint(x: (layer.frame.width - cakeSize.width) / 2 , y: layer.frame.height - cakeSize.height - 20)
        
        cakeLayer.frame = CGRect(origin: cakeOrigin, size: cakeSize)
        
        confettiLayer.emitterPosition = CGPoint(x: frame.width / 2, y: 0)
        confettiLayer.emitterSize = CGSize(width: frame.width, height: frame.height)
        
        let congratulationsSize = CGSize(width: 250, height: 45)
        let congratulationsOrigin = CGPoint(x: (layer.frame.width - congratulationsSize.width) / 2 , y: 50)
        
        congratulationsLayer.frame = CGRect(origin: congratulationsOrigin, size: congratulationsSize)
        
    }
    
}

private extension BirthdayView {
    
    func commonInit() {
        
        layer.addSublayer(gradientLayer)
        layer.addSublayer(cakeLayer)
        layer.addSublayer(confettiLayer)
        layer.addSublayer(congratulationsLayer)
        
    }
    
}

enum Colors: CaseIterable {
    case red
    case blue
    case green
    
    static func random() -> CGColor {
        let color = allCases.randomElement()!
        switch color {
        case .blue:
            return UIColor.blue.cgColor
        case .red:
            return UIColor.red.cgColor
        case .green:
            return UIColor.green.cgColor
        }
    }
}
