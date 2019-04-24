//
//  ViewController.swift
//  Practica-UF2
//
//  Created by Pablo Nuñez on 23/04/2019.
//  Copyright © 2019 Pablo Nuñez y Pol Piedra. All rights reserved.
//

import UIKit

class ViewControllerDrawLines: UIViewController {

    @IBOutlet weak var imageViewDrawingPlace: UIImageView!
    
    var backgroundColor: UIColor?
    var startTouch : CGPoint?
    var secondTouch : CGPoint?
    var currentContext : CGContext?
    var prevImage : UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currentBackgorundColor = backgroundColor {
            imageViewDrawingPlace.backgroundColor = currentBackgorundColor
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        startTouch = touch?.location(in: imageViewDrawingPlace)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            secondTouch = touch.location(in: imageViewDrawingPlace)
            
            if(self.currentContext == nil){
                UIGraphicsBeginImageContext(imageViewDrawingPlace.frame.size)
                self.currentContext = UIGraphicsGetCurrentContext()
            }else{
                self.currentContext?.clear(CGRect(x: 0, y: 0, width: imageViewDrawingPlace.frame.width, height: imageViewDrawingPlace.frame.height))
            }
            
            self.prevImage?.draw(in: self.imageViewDrawingPlace.bounds)
            
            let bezier = UIBezierPath()
            
            bezier.move(to: startTouch!)
            bezier.addLine(to: secondTouch!)
            bezier.close()
            if let currentColor = getColorPixelOnTouched(){
                createGradientLayer(color: currentColor)
                //currentColor.set()
            }
            self.currentContext?.setLineWidth(4)
            self.currentContext?.addPath(bezier.cgPath)
            self.currentContext?.strokePath()
            let img2 = self.currentContext?.makeImage()
            imageViewDrawingPlace.image = UIImage.init(cgImage: img2!)
            
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.currentContext = nil
        self.prevImage = self.imageViewDrawingPlace.image
    }
    
    private func getColorPixelOnTouched()-> UIColor?{
        //TODO: Hacer el optional
        if let currentPrevImage = prevImage {
        guard let inputImage = CIImage(image: currentPrevImage) else { return nil }
        let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)
            
        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }
            
        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull])
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)
            
        return UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
        }
        return nil
    }
    
    private func createGradientLayer(color: UIColor) {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color, UIColor.yellow.cgColor]
        
        self.view.layer.addSublayer(gradientLayer)
    }
}

