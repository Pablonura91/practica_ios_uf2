//
//  ViewController.swift
//  Practica-UF2
//
//  Created by Pablo Nuñez on 23/04/2019.
//  Copyright © 2019 Pablo Nuñez y Pol Piedra. All rights reserved.
//

import UIKit

class ViewControllerDrawLines: UIViewController {
    
    @IBOutlet weak var imageDrawingPlace: ColorView!
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        //TODO: Crear animaciones
        self.view.addSubview(backgroundColor!.changeState())
        
    }
    
    var backgroundColor: ColorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currentBackgorundColor = backgroundColor {
            currentBackgorundColor.createGradientLayer(viewColor: imageDrawingPlace)
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        //TODO: Crear animaciones
        if let currentBackgorundColor = backgroundColor {
            currentBackgorundColor.detectMotion(motion: motion)
        }
    }
}

