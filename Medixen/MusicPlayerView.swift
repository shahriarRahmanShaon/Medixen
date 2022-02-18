//
//  MusicPlayerView.swift
//  Medixen
//
//  Created by sergio shaon on 16/2/22.
//

import SwiftUI

struct MusicPlayerView: View {
    @State var sliderCounter = 0.0
    @StateObject var audioManagerVM: AudioManager
    @Environment(\.presentationMode) var presentationMode
    @State var isEditing = false
    var medixenVM: MedixenViewModel
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            Image(medixenVM.medixen.image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.3)
                .ignoresSafeArea()
            VStack{
                HStack{
                    Button {
                        presentationMode.wrappedValue.dismiss()
                        audioManagerVM.player?.stop()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 40))
                            .foregroundColor(Color.white)
                            .shadow(radius: 10)
                    }
                    Spacer()
                    
                }.padding()
                Text(medixenVM.medixen.title)
                    .font(.title)
                    .foregroundColor(Color.white)
                Spacer()
                if let player = audioManagerVM.player{
                    VStack{
                        Slider(value: $sliderCounter, in: 0...player.duration){ editing in
                            print(editing)
                            isEditing = editing
                            if !editing{
                                player.currentTime = sliderCounter
                            }
                        }
                            .accentColor(Color.white)
                        HStack{
                            Text(DateComponentsFormatter().timeInMinuteAndSecondsOnly.string(from: player.currentTime) ?? "0.00")
                            Spacer()
                            Text(DateComponentsFormatter().timeInMinuteAndSecondsOnly.string(from: player.duration - player.currentTime) ?? "0:00")
                        }.foregroundColor(Color.white)
                        HStack{
                            PlaybackControlView(imageName: "repeat"){
                               
                            }
                            Spacer()
                            PlaybackControlView(imageName: "gobackward.10"){
                                player.currentTime -= 10
                            }
                            Spacer()
                            PlaybackControlView(imageName: player.isPlaying ? "pause.circle.fill" : "play.circle.fill", fontSIze: 45){
                                audioManagerVM.playPause()
                            }
                            Spacer()
                            PlaybackControlView(imageName: "goforward.10"){
                                player.currentTime += 10
                            }
                            Spacer()
                            PlaybackControlView(imageName: "stop.fill"){
                                
                            }
                        }
                    }.padding()
                }
            }
        }
        .onReceive(timer) { _ in
            if let player = audioManagerVM.player, !isEditing{
                sliderCounter = player.currentTime
            }
        }
        .onAppear {
            audioManagerVM.startAudioPlyer(musicTrack: medixenVM.medixen.track)
        }
    }
}

struct MusicPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayerView(audioManagerVM: AudioManager(), medixenVM: MedixenViewModel(MedixenModel.MedixenSingleton))
    }
}
