//
//  ViewController.swift
//  Practica-UF2
//
//  Created by Pablo Nuñez on 23/04/2019.
//  Copyright © 2019 Pablo Nuñez y Pol Piedra. All rights reserved.
//

import UIKit

class ViewControllerDrawLines: UIViewController {

    @IBOutlet weak var drawingPlace: UIImageView!
    
    var backgroundColor: UIColor?
    var startTouch : CGPoint?
    var secondTouch : CGPoint?
    var currentContext : CGContext?
    var prevImage : UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currentBackgorundColor = backgroundColor {
            drawingPlace.backgroundColor = currentBackgorundColor
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        startTouch = touch?.location(in: drawingPlace)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            secondTouch = touch.location(in: drawingPlace)
            
            if(self.currentContext == nil){
                UIGraphicsBeginImageContext(drawingPlace.frame.size)
                self.currentContext = UIGraphicsGetCurrentContext()
            }else{
                self.currentContext?.clear(CGRect(x: 0, y: 0, width: drawingPlace.frame.width, height: drawingPlace.frame.height))
            }
            
            self.prevImage?.draw(in: self.drawingPlace.bounds)
            
            let bezier = UIBezierPath()
            
            bezier.move(to: startTouch!)
            bezier.addLine(to: secondTouch!)
            bezier.close()
            
            UIColor.blue.set()
            
            self.currentContext?.setLineWidth(4)
            self.currentContext?.addPath(bezier.cgPath)
            self.currentContext?.strokePath()
            let img2 = self.currentContext?.makeImage()
            drawingPlace.image = UIImage.init(cgImage: img2!)
            
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.currentContext = nil
        self.prevImage = self.drawingPlace.image
    }


}

