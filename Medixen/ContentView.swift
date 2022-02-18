//
//  ContentView.swift
//  Medixen
//
//  Created by sergio shaon on 15/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MeditationView(medixenVM: MedixenViewModel(MedixenModel.MedixenSingleton), audiManagerVM: AudioManager())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
