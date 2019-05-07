//
//  CollectionViewControllerColors.swift
//  Practica-UF2
//
//  Created by Pablo Nuñez on 23/04/2019.
//  Copyright © 2019 Pablo Nuñez y Pol Piedra. All rights reserved.
//

import UIKit

class CollectionViewControllerColors: UICollectionViewController {
//    var colorsArr: [ColorView] = ([ColorView(frame: CGRect(x: 0, y: 0, width: 150, height: 150)), ColorView(frame: CGRect(x: 0, y: 0, width: 150, height: 150)), ColorView(frame: CGRect(x: 0, y: 0, width: 150, height: 150)), ColorView(frame: CGRect(x: 0, y: 0, width: 150, height: 150)), ColorView(frame: CGRect(x: 0, y: 0, width: 150, height: 150)), ColorView(frame: CGRect(x: 0, y: 0, width: 150, height: 150)), ColorView(frame: CGRect(x: 0, y: 0, width: 150, height: 150)), ColorView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))])
    var colorsArr: [ColorView] = [ColorView]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        

        // Do any additional setup after loading the view.
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 8
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCellColor
        cell.imageColorView.createGradientLayer2()
//        createGradientLayer(color: colors[indexPath.item], viewColor: cell.imageColorView)
        
        colorsArr.append(cell.imageColorView)
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Color Detail Segue" {
            if let cell = sender as? UICollectionViewCell,
                let indexPath = collectionView.indexPath(for: cell)
            {
                if let destinationNavigationController = segue.destination as? UINavigationController,
                    let targetController = destinationNavigationController.topViewController as? ViewControllerDrawLines {
                    
//                        createGradientLayer(color: colors[indexPath.row], viewColor: targetController.view)
                    targetController.backgroundColor = colorsArr[indexPath.row]
                
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
    
}
