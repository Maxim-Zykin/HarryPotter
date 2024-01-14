//
//  Music.swift
//  HarryPotter
//
//  Created by Максим Зыкин on 14.01.2024.
//

import AVFoundation

class MusicHelper {
    static let sharedHelper = MusicHelper()
    var audioPlayer: AVAudioPlayer?
    
    func playBackgroundMusic() {
        let aSound = NSURL(fileURLWithPath:
                            Bundle.main.path(forResource: "592", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
            audioPlayer?.volume = 0.3
           
        }
        catch {
            print("Cannot play the file")
        }
    }
}
