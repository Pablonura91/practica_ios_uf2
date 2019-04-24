//
//  ViewController.swift
//  Practica-UF2
//
//  Created by Pablo Nuñez on 23/04/2019.
//  Copyright © 2019 Pablo Nuñez y Pol Piedra. All rights reserved.
//

import UIKit

class ViewControllerDrawLines: UIViewController {

    @IBOutlet weak var imageDrawingPlace: UIView!
    
    var backgroundColor: ColorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currentBackgorundColor = backgroundColor {
            currentBackgorundColor.createGradientLayer(viewColor: imageDrawingPlace)
        }
    }
}

