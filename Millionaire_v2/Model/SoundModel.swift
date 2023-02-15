//
//  SoundModel.swift
//  Millionaire_v2
//
//  Created by Evgeny Mikhaylov on 11.02.2023.
//

import Foundation
import AVFoundation

struct Player {
    var player: AVAudioPlayer?
    
    mutating func playSound(resource: String) {
        guard let url = Bundle.main.url(forResource: resource, withExtension: "mp3") else { return }
    
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

//var player: AVAudioPlayer!
//
//func playSound(resource: String) {
//    guard let url = Bundle.main.url(forResource: resource, withExtension: "mp3") else { return }
//
//    do {
//        player = try AVAudioPlayer(contentsOf: url)
//        guard let player = player else { return }
//        player.play()
//    } catch let error {
//        print(error.localizedDescription)
//    }
//}
