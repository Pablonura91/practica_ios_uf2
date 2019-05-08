//
//  ViewController.swift
//  Practica-UF2
//
//  Created by Pablo Nuñez on 23/04/2019.
//  Copyright © 2019 Pablo Nuñez y Pol Piedra. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewControllerDrawLines: UIViewController {
    
    var backgroundColor: ColorView?
    
    @IBOutlet weak var gestureMessage: UILabel!
    
    var soundSwipe:SystemSoundID = 0
    var soundRotated:SystemSoundID = 0
    var soundShake :SystemSoundID = 0
    var stepNumber = 0
    var timer = Timer()
    let gesturesMessage = ["Shake me!", "Swipe me!", "Rotated me!"]
    
    @IBOutlet weak var imageDrawingPlace: ColorView!
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
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
        loadSounds()
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
        //initialize timer
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.updateScene), userInfo: nil, repeats: true)
    }
    
    private func loadSounds() {
        if let soundShakeURL = Bundle.main.url(forResource: "earth quake", withExtension: "wav") {
            AudioServicesCreateSystemSoundID(soundShakeURL as CFURL, &soundShake)
        }
        
        if let soundSwipeURL = Bundle.main.url(forResource: "spinning image rotated", withExtension: "wav") {
            AudioServicesCreateSystemSoundID(soundSwipeURL as CFURL, &soundSwipe)
        }
        
        if let soundRotateURL = Bundle.main.url(forResource: "sound rotated gesture", withExtension: "mp3") {
            AudioServicesCreateSystemSoundID(soundRotateURL as CFURL, &soundRotated)
            
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        switch motion {
        case .motionShake:
            AudioServicesPlaySystemSound(soundShake)
            let shakeAnimation = CABasicAnimation(keyPath: "position")
            shakeAnimation.duration = 0.07
            shakeAnimation.repeatCount = 50
            shakeAnimation.autoreverses = true
            shakeAnimation.fromValue = NSValue(cgPoint: CGPoint(x: self.imageDrawingPlace.center.x - 10, y: self.imageDrawingPlace.center.y))
            shakeAnimation.toValue = NSValue(cgPoint: CGPoint(x: self.imageDrawingPlace.center.x + 10, y: self.imageDrawingPlace.center.y))
            imageDrawingPlace.layer.add(shakeAnimation, forKey: "position")
//            shakeAnimation.addAnimations {
//                self.imageDrawingPlace.center = CGPoint(x: self.imageDrawingPlace.center.x + 20, y: self.imageDrawingPlace.center.y)
//            }
        default:
            break
        }
    }
        
    @objc func rotationGesture() {
        AudioServicesPlaySystemSound(soundRotated)
        UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: 4,
            delay: 0,
            options: .curveEaseOut,
            animations: {
                self.imageDrawingPlace.transform = CGAffineTransform(rotationAngle: CGFloat(180*Double.pi/180))
            },
            completion: {
                if $0 == .end{
                    UIViewPropertyAnimator.runningPropertyAnimator(
                        withDuration: 3,
                        delay: 0,
                        options: UIView.AnimationOptions.curveEaseInOut,
                        animations: {self.imageDrawingPlace.transform = CGAffineTransform.identity},
                        completion:nil
                    )
                }
            }
          )
        }
        
        
    @objc func swipeGesture(_ sender: UISwipeGestureRecognizer) {
        AudioServicesPlaySystemSound(soundSwipe)
            let animation = UIViewPropertyAnimator.runningPropertyAnimator(
                withDuration: 1,
                delay: 0,
                options: [.repeat, .autoreverse, .beginFromCurrentState],
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
        
        animation.startAnimation()
        }
    
    @objc func updateScene(){
        addMessage()
    }
    
    private func addMessage(){
        gestureMessage.text = gesturesMessage[Int.random(in: 0 ... 2)]
    }
}

