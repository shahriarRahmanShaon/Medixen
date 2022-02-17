//
//  PlaybackControlView.swift
//  Medixen
//
//  Created by sergio shaon on 17/2/22.
//

import SwiftUI

struct PlaybackControlView: View {
    var imageName = "play"
    var color: Color = .white
    var fontSIze: CGFloat = 24
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: imageName)
                .foregroundColor(color)
                .font(.system(size: fontSIze))
        }

    }
}

struct PlaybackControlView_Previews: PreviewProvider {
    static var previews: some View {
        PlaybackControlView(action: {})
            .previewLayout(.sizeThatFits)
    }
}
