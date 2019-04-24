//
//  Color.swift
//  Practica-UF2
//
//  Created by Pablo Nuñez on 23/04/2019.
//  Copyright © 2019 Pablo Nuñez y Pol Piedra. All rights reserved.
//

import UIKit

class ColorView {
    var colorsArr: [UIColor]?
    
    init(colorUp: UIColor, colorDown: UIColor) {
        colorsArr = [UIColor]()
        colorsArr?.append(colorUp)
        colorsArr?.append(colorDown)
    }
    
    func createGradientLayer(viewColor: UIView) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = viewColor.frame
        //        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [colorsArr![0].cgColor, colorsArr![1].cgColor]
        
        viewColor.layer.addSublayer(gradientLayer)
    }
}
