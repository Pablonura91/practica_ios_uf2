//
//  CollectionViewControllerColors.swift
//  Practica-UF2
//
//  Created by Pablo Nuñez on 23/04/2019.
//  Copyright © 2019 Pablo Nuñez y Pol Piedra. All rights reserved.
//

import UIKit

class CollectionViewControllerColors: UICollectionViewController {
    let colors = [UIColor.red, UIColor.blue, UIColor.green, UIColor.gray, UIColor.purple, UIColor.orange]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return colors.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCellColor
    
        createGradientLayer(color: colors[indexPath.item], viewColor: cell.imageColorView)
    
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Color Detail Segue" {
            if let cell = sender as? UICollectionViewCell,
                let indexPath = collectionView.indexPath(for: cell)
            {
                if let destinationNavigationController = segue.destination as? UINavigationController,
                    let targetController = destinationNavigationController.topViewController as? ViewControllerDrawLines {
                        createGradientLayer(color: colors[indexPath.row], viewColor: targetController.view)
                        //targetController.backgroundColor = colors[indexPath.row]
                }
            }
        }
    }
    
    @IBAction func goBack(segue: UIStoryboardSegue){
        switch segue.identifier {
        case "cancelDetailFilm": break
            
        default:
            break
        }
    }

    private func createGradientLayer(color: UIColor, viewColor: UIView) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = viewColor.frame
//        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color.cgColor, UIColor.yellow.cgColor]
        
        viewColor.layer.addSublayer(gradientLayer)
    }
    
}
