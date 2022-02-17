//
//  MusicPlayerView.swift
//  Medixen
//
//  Created by sergio shaon on 16/2/22.
//

import SwiftUI

struct MusicPlayerView: View {
    @State var sliderCounter = 0.0
    @Environment(\.presentationMode) var presentationMode
    var medixenVM: MedixenViewModel
    
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
                        
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 40))
                            .foregroundColor(Color.white)
                    }
                    Spacer()

                }.padding()
                Text(medixenVM.medixen.title)
                    .font(.title)
                    .foregroundColor(Color.white)
                Spacer()
                VStack{
                    Slider(value: $sliderCounter, in: 0...200)
                        .accentColor(Color.white)
                    HStack{
                        Text("0:00")
                        Spacer()
                        Text("1:00")
                    }.foregroundColor(Color.white)
                    HStack{
                        PlaybackControlView(imageName: "repeat"){
                            
                        }
                        Spacer()
                        PlaybackControlView(imageName: "gobackward.10"){
                            
                        }
                        Spacer()
                        PlaybackControlView(imageName: "play.circle.fill", fontSIze: 45){
                            
                        }
                        Spacer()
                        PlaybackControlView(imageName: "goforward.10"){
                            
                        }
                        Spacer()
                        PlaybackControlView(imageName: "stop.fill"){
                            
                        }
                    }
                }.padding()
            }
        }
    }
}

struct MusicPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayerView(medixenVM: MedixenViewModel(MedixenModel.MedixenSingleton))
    }
}
