//
//  SingletonMusicOnBackground.swift
//  Practica-UF2
//
//  Created by Pablo Nuñez on 09/05/2019.
//  Copyright © 2019 Pablo Nuñez y Pol Piedra. All rights reserved.
//

import Foundation
import AVFoundation

class SingletonMusicOnBackground {
    static let sharedInstance = SingletonMusicOnBackground()
    private var player: AVAudioPlayer?
    
    func create(){
        do {
            try AVAudioSession.sharedInstance().setActive(true)
        }catch {
        
        }
        
        if let backgroundURL = Bundle.main.url(forResource: "soundBackground", withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: backgroundURL)
                player?.numberOfLoops = Int(-1)
                player?.prepareToPlay()
                //player.play()
                
            } catch {
            
            }
        }
    }
    
    func play() {
        player?.play()
    }
        
    func isPlaying() -> Bool{
        if let currentPlayer = player {
            return currentPlayer.isPlaying
        }
        return false
    }
    
    func pause() {
        player?.pause()
    }
    
    func stop() {
        player?.stop()
    }
}
