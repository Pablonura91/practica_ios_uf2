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
        UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: 6.0,
            delay: 0,
            options: .curveEaseOut,
            animations: {
                self.imageDrawingPlace.transform = CGAffineTransform(rotationAngle: 30)
        },
            completion: {if $0 == .end{
                    UIViewPropertyAnimator.runningPropertyAnimator(
                        withDuration: 5,
                        delay: 0,
                        options: UIView.AnimationOptions.curveEaseInOut,
                        animations: {self.imageDrawingPlace.transform = CGAffineTransform(scaleX: -6, y: -10)},
                        completion: {
                            if $0 == .end{
                                UIViewPropertyAnimator.runningPropertyAnimator(
                                    withDuration: 5,
                                    delay: 0,
                                    options: UIView.AnimationOptions.curveEaseInOut,
                                    animations: {self.imageDrawingPlace.transform = CGAffineTransform.identity},
                                    completion:nil
                                ) }
                    })
                }
            })
        
    }
    
    var backgroundColor: ColorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currentBackgorundColor = backgroundColor {
            currentBackgorundColor.createGradientLayer(viewColor: imageDrawingPlace)
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        switch motion {
        case .motionShake:
            UIViewPropertyAnimator.runningPropertyAnimator(
                    withDuration: 5,
                    delay: 0,
                    options: UIView.AnimationOptions.curveEaseInOut,
                    animations: {self.imageDrawingPlace.alpha = 0},
                    completion: {
//                        self.imageDrawingPlace.removeFromSuperview()
                        if $0 == .end{
                            UIViewPropertyAnimator.runningPropertyAnimator(
                                withDuration: 5,
                                delay: 0,
                                options: UIView.AnimationOptions.curveEaseInOut,
                                animations: {
                                    self.imageDrawingPlace.alpha = 1
                                },
                                completion: nil
                            )
                        }
                    }
            )
            
        default:
            break
        }
    }
}

