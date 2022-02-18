//
//  MedixenModel.swift
//  Medixen
//
//  Created by sergio shaon on 17/2/22.
//

import Foundation

struct MedixenModel{
    static let MedixenSingleton = MedixenModel(title: "1 Minute Relaxing Music", duration: 50, description: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled", track: "meditationFile1", image: "meditationBg")
    
    let id = UUID()
    let title: String
    let duration: TimeInterval
    let description: String
    let track: String
    let image: String
    
}
