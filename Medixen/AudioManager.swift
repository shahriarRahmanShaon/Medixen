//
//  AudioManager.swift
//  Medixen
//
//  Created by sergio shaon on 17/2/22.
//

import Foundation
import AVKit

class AudioManager: ObservableObject{
    @Published var player: AVAudioPlayer?
    
    func startAudioPlyer(musicTrack: String){
        guard let url = Bundle.main.url(forResource: musicTrack, withExtension: "mp3") else{
            print("failed to find the url track")
            return
        }
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }catch{
            print("couldn't find the track")
        }
    }
}
