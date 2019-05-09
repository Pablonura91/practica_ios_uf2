//
//  Color.swift
//  Practica-UF2
//
//  Created by Pablo Nuñez on 23/04/2019.
//  Copyright © 2019 Pablo Nuñez y Pol Piedra. All rights reserved.
//

import UIKit

class ColorView: UIView {
    var colorsGradient: [UIColor]?
    
//    @IBInspectable
//    var positionView: CGPoint {return CGPoint(x: bounds.midX, y: bounds.midY)}
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        self.center = CGPoint(x: bounds.midX, y: bounds.midX)
        asincColor()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        asincColor()
    }
    
    private func asincColor(){
        colorsGradient = [UIColor]()
        colorsGradient?.append(UIColor(displayP3Red: colorRandom(), green: colorRandom(), blue: colorRandom(), alpha: 1))
        colorsGradient?.append(UIColor(displayP3Red: colorRandom(), green: colorRandom(), blue: colorRandom(), alpha: 1))
        colorsGradient?.append(UIColor(displayP3Red: colorRandom(), green: colorRandom(), blue: colorRandom(), alpha: 1))
        colorsGradient?.append(UIColor(displayP3Red: colorRandom(), green: colorRandom(), blue: colorRandom(), alpha: 1))
    }
    
    private func colorRandom() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
    func createGradientLayer(colors: [UIColor]) {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.frame
        //        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [colors[0].cgColor, colors[1].cgColor, colors[2].cgColor, colors[3].cgColor]
        
        self.layer.addSublayer(gradientLayer)
    }
    func createGradientLayer2() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.frame
        //        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [colorsGradient![0].cgColor, colorsGradient![1].cgColor, colorsGradient![2].cgColor, colorsGradient![3].cgColor]
        
        self.layer.addSublayer(gradientLayer)
    }
}
