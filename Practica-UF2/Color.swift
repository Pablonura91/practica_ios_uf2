//
//  Color.swift
//  Practica-UF2
//
//  Created by Pablo Nuñez on 23/04/2019.
//  Copyright © 2019 Pablo Nuñez y Pol Piedra. All rights reserved.
//

import UIKit

class Color: UIView {
    var color: Array<UIColor>?
    
    private func createGradientLayer(color: UIColor, viewColor: UIView) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = viewColor.frame
        //        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color.cgColor, UIColor.yellow.cgColor]
        
        viewColor.layer.addSublayer(gradientLayer)
    }
}
