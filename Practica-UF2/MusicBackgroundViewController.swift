//
//  MusicBackgroundViewController.swift
//  Practica-UF2
//
//  Created by Mac de Pol on 06/05/2019.
//  Copyright © 2019 Pablo Nuñez y Pol Piedra. All rights reserved.
//

import UIKit
import AVFoundation

class MusicBackgroundViewController: UIViewController {
    
    @IBOutlet weak var musicStatus: UIImageView!
    
    var backgroundAudioPlayer:AVAudioPlayer?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        SingletonMusicOnBackground.sharedInstance.create()
        checkStatusMusic()
            
        // Do any additional setup after loading the view.
            let tapGestureRecognizer = UITapGestureRecognizer(
                target: self,
                action: #selector(self.playMusic)
            )
            
            musicStatus.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func playMusic() {
        let singletonMusicOnBackground = SingletonMusicOnBackground.sharedInstance
            if singletonMusicOnBackground.isPlaying(){
                singletonMusicOnBackground.pause()
            } else {
                singletonMusicOnBackground.play()
            }
            checkStatusMusic()
    }
    
    private func checkStatusMusic() {
        let player = SingletonMusicOnBackground.sharedInstance
            if player.isPlaying() {
                musicStatus.image = UIImage(named: "musicOn")
            }else {
                musicStatus.image = UIImage(named: "mute")
            }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
