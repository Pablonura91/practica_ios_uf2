//
//  ViewController.swift
//  Practica-UF2
//
//  Created by Pablo Nuñez on 23/04/2019.
//  Copyright © 2019 Pablo Nuñez y Pol Piedra. All rights reserved.
//

import UIKit

class ViewControllerDrawLines: UIViewController {
    
    var backgroundColor: ColorView?
    
    @IBOutlet weak var imageDrawingPlace: ColorView!
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        //TODO: Crear animaciones
        UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: 6.0,
            delay: 0,
            options: .curveEaseOut,
            animations: {
                var transform = CGAffineTransform(
                    translationX: self.imageDrawingPlace.frame.width-self.imageDrawingPlace.frame.width,
                    y: 0)
                transform = transform.rotated(by: CGFloat(180*Double.pi/180))
                self.imageDrawingPlace.transform=transform

            },
            completion: {if $0 == .end{
                    UIViewPropertyAnimator.runningPropertyAnimator(
                        withDuration: 5,
                        delay: 0,
                        options: UIView.AnimationOptions.curveEaseInOut,
                        animations: {self.imageDrawingPlace.transform = CGAffineTransform(scaleX: -20, y: 10)},
                        completion: {
                            if $0 == .end{
                                UIViewPropertyAnimator.runningPropertyAnimator(
                                    withDuration: 5,
                                    delay: 0,
                                    options: UIView.AnimationOptions.curveEaseInOut,
                                    animations: {self.imageDrawingPlace.transform = CGAffineTransform.identity},
                                    completion:nil
                                )
                            }
                        }
                    )
                }
            }
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currentBackgorundColor = backgroundColor {
            currentBackgorundColor.createGradientLayer(viewColor: imageDrawingPlace)
//          Add Gesture recognizer
            let swipeGestureRecognizer = UISwipeGestureRecognizer(
                target: self,
                action: #selector(self.swipeGesture)
            )
            
            swipeGestureRecognizer.direction = UISwipeGestureRecognizer.Direction.right
            imageDrawingPlace.addGestureRecognizer(swipeGestureRecognizer)
            
            let rotationGestureRecognizer = UIRotationGestureRecognizer(
                target: self,
                action: #selector(self.rotationGesture)
            )
            
            imageDrawingPlace.addGestureRecognizer(rotationGestureRecognizer)
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
        
    @objc func rotationGesture() {
            UIViewPropertyAnimator.runningPropertyAnimator(
                withDuration: 5,
                delay: 0,
                options: UIView.AnimationOptions.curveEaseInOut,
                animations: {self.imageDrawingPlace.transform = CGAffineTransform(scaleX: -20, y: 10)},
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
        
        
    @objc func swipeGesture(_ sender: UISwipeGestureRecognizer) {
            UIViewPropertyAnimator.runningPropertyAnimator(
                withDuration: 1,
                delay: 0,
                options: UIView.AnimationOptions.curveLinear,
                animations: {
                    self.imageDrawingPlace.transform = CGAffineTransform(scaleX: -1, y: 1)
                },
                completion: {
                    if $0 == .end{
                        UIViewPropertyAnimator.runningPropertyAnimator(
                            withDuration: 1,
                            delay: 0,
                            options: UIView.AnimationOptions.curveEaseInOut,
                            animations: {self.imageDrawingPlace.transform = CGAffineTransform.identity},
                            completion:nil
                        ) }
            })
        }
}

