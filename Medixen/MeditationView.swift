//
//  MeditationView.swift
//  Medixen
//
//  Created by sergio shaon on 16/2/22.
//

import SwiftUI

struct MeditationView: View {
    @State private var isPresented = false
    @StateObject var medixenVM: MedixenViewModel
    
    var body: some View {
        VStack(spacing: 0){
            Image(medixenVM.medixen.image)
                .resizable()
                .scaledToFill()
                .frame(height: UIScreen.main.bounds.height/3)
            ZStack{
                Color.black
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        VStack(alignment: .leading, spacing: 5){
                            Text("Music")
                            Text(medixenVM.medixen.duration.formatted() + "")
                        }
                        .padding(.vertical, 10)
                        .font(.headline)
                        Spacer()
                    }.padding(.horizontal, 5)
                    Text(medixenVM.medixen.title)
                        .font(.title)
                    Button {
                        isPresented.toggle()
                    } label: {
                        Label("Play", systemImage: "play.fill")
                            .foregroundColor(Color.black)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background()
                            .cornerRadius(10)
                    }
                    Text(medixenVM.medixen.description)
                    Spacer()

                }.foregroundColor(Color.white)
            }
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $isPresented){
            MusicPlayerView(medixenVM: medixenVM)
        }

    }
}

struct MeditationView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationView(medixenVM: MedixenViewModel(MedixenModel.MedixenSingleton))
    }
}
