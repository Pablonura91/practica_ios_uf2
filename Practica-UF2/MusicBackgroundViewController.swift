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
        
        do {
            try AVAudioSession.sharedInstance().setActive(true)
        }catch {
            print("Settings")
        }
        
        if let backgroundURL = Bundle.main.url(forResource: "soundBackground", withExtension: "mp3") {
        do {
            try backgroundAudioPlayer = AVAudioPlayer(contentsOf: backgroundURL)
            if let player = backgroundAudioPlayer {
                player.numberOfLoops = Int(-1)
                player.prepareToPlay()
                //player.play()
            }
        } catch {
            print("Negro")
        }
            
        checkStatusMusic()
            
        // Do any additional setup after loading the view.
            let tapGestureRecognizer = UITapGestureRecognizer(
                target: self,
                action: #selector(self.playMusic)
            )
            
            musicStatus.addGestureRecognizer(tapGestureRecognizer)
        }
    }
    
    @objc private func playMusic() {
        if let player = backgroundAudioPlayer {
            if player.isPlaying {
                player.pause()
            } else {
                player.play()
            }
            checkStatusMusic()
        }
    }
    
    private func checkStatusMusic() {
        if let player = backgroundAudioPlayer {
            if player.isPlaying {
                musicStatus.image = UIImage(named: "musicOn")
            }else {
                musicStatus.image = UIImage(named: "mute")
            }
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
