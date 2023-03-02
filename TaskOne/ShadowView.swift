//
//  ShadowView.swift
//  TaskOne
//
//  Created by Руслан Шигапов on 02.03.2023.
//

import UIKit

class ShadowView: UIView {
    
    private let imageView = UIImageView()
    
    private let cornerRadius: CGFloat = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupShadow()
        setupGradient()
    }
    
    private func setup() {
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        imageView.layer.cornerRadius = cornerRadius
        imageView.clipsToBounds = true
    }
    
    private func setupShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 7
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 2.5, height: 2.5)

        let cgPath = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: [.allCorners],
            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)
        ).cgPath
        layer.shadowPath = cgPath
    }
    
    private func setupGradient() {
        imageView.addGradientLayer(
            topColor: UIColor(red: 210/255, green: 109/255, blue: 128/255, alpha: 1),
            bottomColor: UIColor(red: 107/255, green: 148/255, blue: 230/255, alpha: 1)
        )
    }
 }

extension UIView {
    
    func addGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
